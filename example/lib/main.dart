import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ARKitController arkitController;

  @override
  void dispose() {
    arkitController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('ARKit in Flutter'),
            ),
            body: Container(
              child: ARKitSceneView(
                showStatistics: true,
                onARKitViewCreated: onARKitViewCreated,
              ),
            )),
      );

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;

    _addSphere(this.arkitController);
    _addPlane(this.arkitController);
    _addText(this.arkitController);
  }

  void _addSphere(ARKitController controller) {
    final material = ARKitMaterial(
      diffuse: ARKitMaterialProperty(
        color: Colors.red,
      ),
    );
    final sphere = ARKitSphere(
      position: const ARKitVector3(0, 0, -0.5),
      materials: [material],
      radius: 0.1,
    );
    controller.addSphere(sphere);
  }

  void _addPlane(ARKitController controller) {
    final plane = ARKitPlane(
      width: 1,
      height: 1,
      position: const ARKitVector3(0.4, 0.4, -1.5),
      materials: [
        ARKitMaterial(
          diffuse: ARKitMaterialProperty(color: Colors.green),
        )
      ],
    );
    controller.addPlane(plane);
  }

  void _addText(ARKitController controller) {
    final text = ARKitText(
      text: 'Flutter',
      extrusionDepth: 1,
      position: const ARKitVector3(0, 0, -0.5),
      scale: const ARKitVector3(0.02, 0.02, 0.02),
      materials: [
        ARKitMaterial(
          diffuse: ARKitMaterialProperty(color: Colors.blue),
        )
      ],
    );
    controller.addText(text);
  }
}
