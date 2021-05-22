import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:vector_math/vector_math_64.dart';

class IOSAugmentedReality extends StatefulWidget {
  static String routeName = "IOSAugmentedReality";
  @override
  _IOSAugmentedRealityState createState() => _IOSAugmentedRealityState();
}

class _IOSAugmentedRealityState extends State<IOSAugmentedReality> {
  ARKitController arkitController;

  @override
  void dispose() {
    arkitController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("AR View"),
        ),
        body: ARKitSceneView(onARKitViewCreated: onARKitViewCreated),
      );

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    final node = ARKitNode(
      geometry: ARKitBox(height: 325, width: 325, length: 100, materials: [
        ARKitMaterial(
            diffuse: ARKitMaterialProperty(
                image:
                    'https://images.unsplash.com/photo-1579965342575-16428a7c8881?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGFpbnRpbmd8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'))
      ]),
      position: Vector3(0, 0, -1.5),
    );
    this.arkitController.add(node);
  }
}
