import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';

import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:http/http.dart' as http;

class AugmentedRealityScreen extends StatefulWidget {
  static String routeName = "AugmentedRealityScreen";
  @override
  _AugmentedRealityScreenState createState() => _AugmentedRealityScreenState();
}

class _AugmentedRealityScreenState extends State<AugmentedRealityScreen> {
  ArCoreController arCoreController;
  bool isInit = true;

  String imageUrl = "";

  _onArCoreViewCreated(ArCoreController _arCoreController) {
    arCoreController = _arCoreController;
    arCoreController.enablePlaneRenderer;
    _viewImageAR(arCoreController);
  }

  void _viewImageAR(ArCoreController controller) async {
    final material = ArCoreMaterial(
      color: Colors.deepPurple,
    );
    var uri = Uri.parse(imageUrl);

    http.Response response = await http.get(uri);
    print(response.body);
    final bytes = response.bodyBytes;

    final node = ArCoreNode(
      image: ArCoreImage(bytes: bytes, width: 325, height: 325),
      position: vector.Vector3(0.0, 0.0, -1.5),
      rotation: vector.Vector4(0.0, 0.0, 0.0, 0.0),
    );

    controller.addArCoreNode(node);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (isInit) {
      isInit = false;
      imageUrl = ModalRoute.of(context).settings.arguments;
      print(imageUrl);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print(imageUrl);
    return Scaffold(
      appBar: AppBar(),
      body: ArCoreView(
        onArCoreViewCreated: _onArCoreViewCreated,
      ),
    );
  }
}
