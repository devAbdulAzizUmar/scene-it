import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final bool isMe;
  final String message;
  ChatBubble({
    @required this.isMe,
    @required this.message,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: isMe ? Radius.circular(5) : Radius.circular(20),
              topRight: !isMe ? Radius.circular(5) : Radius.circular(20),
              bottomRight: isMe ? Radius.circular(0) : Radius.circular(5),
              bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(5),
            ),
            color: isMe ? Colors.blueGrey[100] : Colors.blue[100],
          ),
          constraints: BoxConstraints(
            minWidth: 20,
            maxWidth: 350,
            minHeight: 40,
          ),
          child: Text(message),
          margin: EdgeInsets.only(bottom: 5),
        ),
      ],
    );
  }
}
