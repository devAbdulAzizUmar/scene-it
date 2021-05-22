import 'dart:convert';

import 'package:first_app/Widgets/AdaptiveList/adaptiveListItem.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SelectSubCategoryScreen extends StatefulWidget {
  static const routeName = "SelectSubCategoryScreen";

  @override
  _SelectSubCategoryScreenState createState() => _SelectSubCategoryScreenState();
}

class _SelectSubCategoryScreenState extends State<SelectSubCategoryScreen> {
  final json = rootBundle.loadString("lib/Models/MainCategories.json");
  bool isInit = true;
  String title = "";
  var jsonData;
  int index;
  int itemCount;
  List subcategories;

  @override
  void didChangeDependencies() {
    if (isInit) {
      isInit = false;
      index = ModalRoute.of(context).settings.arguments;
      json.then((data) {
        jsonData = jsonDecode(data);
        title = jsonDecode(data)[index]["name"];
      });
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    itemCount = jsonData[index]["subType"]["children"].length;
    subcategories = jsonData[index]["subType"]["children"];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: buildList(),
    );
  }

  Widget buildList() {
    return ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return AdaptiveListItem(
            onTap: () {},
            leading: Image.asset(
              "assets/VehicleBodies/${subcategories[index]['image']}",
              height: 40,
              width: 40,
              color: Colors.green,
            ),
            title: Text(
              subcategories[index]["name"],
            ),
          );
        });
  }
}
