import 'dart:io';

import 'package:flutter/material.dart';

class AdaptiveListItem extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Function onTap;
  AdaptiveListItem({
    this.leading,
    this.title,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        padding: EdgeInsets.only(left: 10),
        width: double.infinity,
        child: Platform.isAndroid
            ? ListTile(
                leading: Container(
                  padding: EdgeInsets.all(5),
                  child: leading,
                ),
                title: title,
              )
            : Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    child: leading,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 15),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                      child: title,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
