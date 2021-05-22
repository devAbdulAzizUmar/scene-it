import 'package:first_app/Screens/select_sub_category_screen.dart';
import 'package:first_app/Widgets/AdaptiveList/adaptiveListItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectCategoryScreen extends StatelessWidget {
  static const routeName = "SelectCategoryScreen";
  final listTileData = [
    [CupertinoIcons.car_detailed, "Cars and Vehicles"],
    [Icons.tv, "Electronics and Home Appliances"],
    [CupertinoIcons.building_2_fill, "Property"],
    [CupertinoIcons.briefcase, "Jobs"],
    [CupertinoIcons.hammer, "Services"],
    [CupertinoIcons.home, "Community"],
    [Icons.pets, "Pets"],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Main Category"),
      ),
      body: buildListView(),
    );
  }

  //----------------------------------

  Widget buildListView() {
    return ListView.builder(
      itemCount: listTileData.length,
      itemBuilder: (context, index) {
        return AdaptiveListItem(
          onTap: () {
            Navigator.of(context).pushNamed(
              SelectSubCategoryScreen.routeName,
              arguments: index,
            );
          },
          leading: Icon(
            listTileData[index][0],
            color: Colors.blue,
          ),
          title: Text(
            listTileData[index][1],
          ),
        );
      },
    );
  }
}
