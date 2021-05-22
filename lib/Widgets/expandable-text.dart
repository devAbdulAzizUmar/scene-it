import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  @override
  _ExpandableTextState createState() => _ExpandableTextState();
  final String body;
  final int maxLength;

  ExpandableText({
    this.body,
    this.maxLength = 200,
  });
}

class _ExpandableTextState extends State<ExpandableText>
    with TickerProviderStateMixin {
  String firstText;
  String secondText;
  bool isShowingMore = false;

  @override
  void initState() {
    if (widget.body.length > widget.maxLength) {
      firstText = widget.body.substring(0, widget.maxLength);
      secondText = widget.body.substring(widget.maxLength, widget.body.length);
    } else {
      firstText = widget.body;
      secondText = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
        vsync: this,
        reverseDuration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
        duration: Duration(milliseconds: 300),
        child: secondText.isEmpty
            ? RichText(
                text: TextSpan(
                  text: firstText,
                  style: TextStyle(
                      wordSpacing: 0.5,
                      color: Colors.black,
                      letterSpacing: 0.1,
                      fontSize: 16),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                      text: isShowingMore
                          ? firstText + secondText
                          : firstText + "...",
                      style: TextStyle(
                          wordSpacing: 0.5,
                          color: Colors.black,
                          letterSpacing: 0.1,
                          fontSize: 16),
                    ),
                  ),
                  TextButton(
                    child: Text(
                      isShowingMore ? "Show less" : "Show more",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onPressed: () {
                      setState(() {
                        isShowingMore = !isShowingMore;
                      });
                    },
                  ),
                ],
              ));
  }
}
