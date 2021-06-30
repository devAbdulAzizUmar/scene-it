import 'dart:convert';

import 'package:first_app/Models/Chat/message.dart';
import 'package:first_app/Models/user.dart';
import 'package:first_app/Widgets/Chat/chatBubble.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = "ChatScreen";
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _socket = IOWebSocketChannel.connect("wss://chat.ws.cappstech.com");

  String _recipientId = "";
  String _recipientName = "";
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _isInit = false;
      final arguments =
          ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
      _recipientId = arguments["recipientId"];
      _recipientName = arguments["recipientName"];

      print("Recipient: $_recipientId");
      print("Current User: ${CurrentUser.id}");

      _socket.sink.add(
        jsonEncode({
          "type": "AUTHENTICATE",
          "token": CurrentUser.token,
          "fromId": CurrentUser.id,
          "toId": _recipientId,
        }),
      );
      super.didChangeDependencies();
    }
  }

  @override
  void dispose() {
    _socket.sink.close();
    _inputController.dispose();
    super.dispose();
  }

  final List<dynamic> messages = [];
  final _inputController = TextEditingController();
  String myMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            _recipientName == CurrentUser.firstName ? "You" : _recipientName),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder(
                  stream: _socket.stream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: CircularProgressIndicator.adaptive());
                    }

                    if (snapshot.hasData) {
                      final decodedSnapshot = jsonDecode(snapshot.data);
                      if (messages.isEmpty) {
                        messages.add(initialMessageContainer());
                      }

                      if (decodedSnapshot["type"] == "NEW_MESSAGE") {
                        bool isMe = decodedSnapshot["payload"]["fromId"] ==
                            CurrentUser.id;
                        messages.add(
                          Message(
                            isMe: isMe,
                            message: decodedSnapshot["payload"]["message"],
                          ),
                        );
                      } else if (decodedSnapshot["type"] == "UPDATE_STATUS") {
                        messages.add(Message(isMe: true, message: myMessage));
                      }
                      final reversedMessages = messages.reversed.toList();
                      return ListView.builder(
                          reverse: true,
                          itemCount: reversedMessages.length,
                          itemBuilder: (context, index) {
                            if (index == reversedMessages.length - 1) {
                              return reversedMessages[index];
                            }
                            return ChatBubble(
                                isMe: reversedMessages[index].isMe,
                                message: reversedMessages[index].message);
                          });
                    } else
                      return Text("NO data");
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 5, left: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _inputController,
                        decoration: InputDecoration(
                          labelText: "Enter message",
                          hintText: "Enter a message...",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            topLeft: Radius.circular(10),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(50)),
                      child: IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.send),
                        onPressed: () {
                          final message = _inputController.text.trim();
                          if (message.isNotEmpty) {
                            myMessage = message;
                            print(message);

                            _socket.sink.add(jsonEncode(
                              {
                                "type": "MESSAGE",
                                "token": CurrentUser.token,
                                "fromId": CurrentUser.id,
                                "toId": _recipientId,
                                "message": message,
                              },
                            ));
                            _inputController.text = "";
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget initialMessageContainer() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      alignment: Alignment.center,
      constraints: BoxConstraints(minHeight: 60),
      decoration: BoxDecoration(
          color: Colors.blueGrey[200], borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Text(
        "You are currently chatting with $_recipientName. For your safety, please do not exchange personal information.",
        textAlign: TextAlign.center,
      ),
    );
  }
}
