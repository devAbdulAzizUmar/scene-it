import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String imageUrl;
  final tag;
  ImageView({
    this.imageUrl,
    this.tag,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Hero(
        tag: tag,
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(bottom: 5),
            height: 250,
            width: double.infinity,
            child: FadeInImage.assetNetwork(
              image: imageUrl,
              placeholder: "assets/loading.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
