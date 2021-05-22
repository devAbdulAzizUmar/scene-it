import 'dart:ui';

import 'package:first_app/Models/post.dart';
import 'package:first_app/Screens/ad-detail-screen.dart';
import 'package:flutter/material.dart';

class BlurredImageView extends StatelessWidget {
  final Post post;
  final index;
  final tag;
  const BlurredImageView({
    @required this.tag,
    @required this.post,
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) {
              return ImageGallery(
                imageCount: post.imageUrls.length,
                imageIndex: tag,
                imageUrls: post.imageUrls,
              );
            },
          ),
        );
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(),
        margin: const EdgeInsets.only(bottom: 5),
        height: 250,
        width: double.infinity,
        child: Stack(
          children: [
            ImageContainer(
              post: post,
              imageUrl: post.imageUrls[index - 1],
              tag: index - 1,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 6),
              child: Container(
                height: 250,
                width: double.infinity,
                decoration:
                    BoxDecoration(color: Colors.black54.withOpacity(0.6)),
                child: Center(
                  child: Text(
                    "+ ${post.imageUrls.length - 2} more",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
