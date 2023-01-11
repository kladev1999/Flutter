import 'dart:async';
import 'dart:io';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:gallery_saver/gallery_saver.dart';

String audioplayers = 'assets/audios/takecamera.mp3';
bool videoColor = false;
var videoStateTxt = '';
var display = '';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
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
  var stopwatch = Stopwatch();

  Timer? time;

  // ignore: unused_element
  void _takepicture() async {
    bool canVidrate = await Vibrate.canVibrate;
    AudioPlayer().play(AssetSource(audioplayers));
    // ignore: avoid_print
    canVidrate ? Vibrate.vibrate() : print('object');
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
          await GallerySaver.saveImage(image.path, toDcim: true);
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> sound() async {
    bool canVidrate = await Vibrate.canVibrate;
    AudioPlayer().play(AssetSource(audioplayers));
    // ignore: avoid_print
    canVidrate ? Vibrate.vibrate() : print('object');
  }

  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  void dispose() {
    stopwatch.stop();
    time?.cancel();
    super.dispose();
  }

  Future<void> startVideoRecording() async {
    try {
      await controller!.startVideoRecording();
      setState(() {
        videoColor = true;
      });
    } on CameraException catch (e) {
      print('Error starting to record video: $e');
    }
  }

  Future<XFile?> stopVideoRecording() async {
    try {
      XFile file = await controller!.stopVideoRecording();
      setState(() {
        videoColor = false;
      });
      return file;
    } on CameraException catch (e) {
      // ignore: avoid_print
      print('Error stopping video recording: $e');
      return null;
    }
  }

  void loadCamera() async {
    cameras = await availableCameras();
    if (cameras != null) {
      controller = CameraController(cameras![_counter], ResolutionPreset.max);
      controller!.initialize().then((_) {
        if (!mounted) return;
        setState(() {
          _counter++;

          if (_counter >= cameras!.length) {
            _counter = 0;
          }
        });
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
      floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              width: 0,
            ),
            FloatingActionButton(
              onPressed: loadCamera,
              // ignore: prefer_const_constructors, sort_child_properties_last
              child: Icon(
                Icons.flip_camera_ios,
                size: 40,
              ),
              // ignore: prefer_const_constructors
              backgroundColor: Color.fromARGB(255, 45, 166, 97),
              heroTag: "fab2",
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  // ignore: unnecessary_string_interpolations
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // ignore: sort_child_properties_last
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${videoStateTxt}'),
                            Text('${display}'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                FloatingActionButton(
                  onPressed: () async {
                    setState(() async {
                      if (videoColor) {
                        display = '';
                        videoStateTxt = '';
                        stopwatch.stop();
                        display = stopwatch.elapsed.inSeconds.toString();
                        stopwatch.reset();
                        XFile? rawVideo = await stopVideoRecording();
                        // ignore: non_constant_identifier_names
                        File VideoFile = File(rawVideo!.path);
                        int currentUnix = DateTime.now().millisecondsSinceEpoch;
                        final directory =
                            await getApplicationDocumentsDirectory();
                        String fileFormat = VideoFile.path.split('.').last;
                        await VideoFile.copy(
                          '${directory.path}/$currentUnix.$fileFormat',
                        );
                        await GallerySaver.saveVideo(rawVideo.path,
                            toDcim: true);
                      } else {
                        await startVideoRecording();
                        _counter++;
                        videoStateTxt = 'Reconding';

                        stopwatch.start();
                        if (time?.isActive == true) {
                          time?.cancel();
                        }
                        time = Timer.periodic(const Duration(microseconds: 96),
                            (_) {
                          setState(() {
                            var h = stopwatch.elapsed.inHours
                                .toString()
                                .padLeft(2, '0');
                            var m = stopwatch.elapsed.inMinutes
                                .remainder(60)
                                .toString()
                                .padLeft(2, '0');
                            var s = stopwatch.elapsed.inSeconds
                                .remainder(60)
                                .toString()
                                .padLeft(2, '0');
                            if (!videoColor) {
                              display = '';
                            } else {
                              display = '$h:$m:$s';
                            }
                          });
                        });
                      }
                    });
                  },
                  backgroundColor: videoColor
                      ? const Color.fromARGB(255, 235, 9, 9)
                      : const Color.fromARGB(255, 45, 166, 97),

                  // ignore: sort_child_properties_last
                  child: const Icon(
                    Icons.videocam,
                    size: 40,
                  ),

                  heroTag: "fab1",
                ),
                const SizedBox(
                  width: 120,
                )
              ],
            ),
            const SizedBox(
              width: 30,
            ),
            FloatingActionButton(
              onPressed: _takepicture,
              // ignore: sort_child_properties_last
              child: const Icon(
                Icons.photo_camera,
                size: 40,
              ),
              backgroundColor: const Color.fromARGB(255, 45, 166, 97),
              heroTag: "fab1",
            ),
          ]),
    );
  }
}
