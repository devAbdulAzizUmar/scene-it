import 'package:first_app/Widgets/AdaptiveList/adaptiveListItem.dart';
import 'package:flutter/material.dart';

class AdaptiveListView extends StatelessWidget {
  final itemCount;
  final list;
  AdaptiveListView({
    this.list,
    this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return AdaptiveListItem(
            leading: Image.asset(
              "assets/VehicleBodies/${list[index]['image']}",
              height: 40,
              width: 40,
              color: Colors.green,
            ),
            title: Text(
              list[index]["name"],
            ),
          );
        });
  }
}
