import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

void main() {
  runApp(const MyCamera());
}
class MyCamera extends StatelessWidget {
  const MyCamera({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<CameraDescription>? cameras;
  CameraController? controller;

  void _takeicture() async {
    try {
      if (controller != null) {
        if (controller!.value.isInitialized) {
          XFile image = await controller!.takePicture();
          File imageFile = File(image.path);

          int currentUnix = DateTime.now().millisecondsSinceEpoch;
          final directory = await getApplicationDocumentsDirectory();
          String fileFormat = imageFile.path.split('.').last;

          await imageFile.copy(
            '${directory.path}/$currentUnix.$fileFormat',
          );
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  void loadCamera() async {
    cameras = await availableCameras();
    if (cameras != null) {
      controller = CameraController(cameras![0], ResolutionPreset.max);
      controller!.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } else {
      print("NO any cameras found");
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: controller == null
            ? const Center(
                child: Text('ไม่มีกล้อง....'),
              )
            : !controller!.value.isInitialized
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : CameraPreview(controller!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _takeicture,
        tooltip: 'Increment',
        child: const Icon(Icons.camera_alt_sharp),
      ),
    );
  }
}
