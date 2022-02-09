import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({
    required this.camera,
  });
  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

enum FlashStatus { ON, OFF, Auto }

class TakePictureScreenState extends State<TakePictureScreen> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  var flashStatus;
  Future<void> initalize() async {
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _controller!.setFlashMode(FlashMode.auto);
  }

  @override
  void initState() {
    super.initState();
    initalize();
    flashStatus = FlashStatus.Auto;
    _initializeControllerFuture = _controller!.initialize();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                CameraPreview(_controller!),
                Expanded(
                  child: Container(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: Icon(Icons.image),
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: flashStatus == FlashStatus.Auto
                            ? Icon(Icons.flash_auto)
                            : flashStatus == FlashStatus.OFF
                                ? Icon(Icons.flash_off)
                                : Icon(Icons.flash_on),
                        onPressed: () {
                          if (flashStatus == FlashStatus.Auto) {
                            //...
                            _controller!.setFlashMode(FlashMode.off);
                            setState(() {
                              flashStatus = FlashStatus.OFF;
                            });
                          } else if (flashStatus == FlashStatus.OFF) {
                            //...
                            _controller!.setFlashMode(FlashMode.always);
                            setState(() {
                              flashStatus = FlashStatus.ON;
                            });
                          } else if (flashStatus == FlashStatus.ON) {
                            //...
                            _controller!.setFlashMode(FlashMode.auto);
                            setState(() {
                              flashStatus = FlashStatus.Auto;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                )
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _initializeControllerFuture;

            final image = await _controller!.takePicture();
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;

  const DisplayPictureScreen({required this.imagePath});

  @override
  _DisplayPictureScreenState createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  bool _isAnalysing = true;

  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(date);
    return formatted;
  }

  Future<void> fetch() async {
    print("working...............");
    final TextRecognizer cloudTextRecognizer =
        FirebaseVision.instance.cloudTextRecognizer();
    final VisionText visionText = await cloudTextRecognizer.processImage(
      FirebaseVisionImage.fromFile(File(widget.imagePath))
    );
    print(visionText.text);
  }
  @override
  void initState() {
    fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Image.file(
                File(widget.imagePath),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: Text("Save"))
            ],
          ),
          if (_isAnalysing)
            Container(
              width: double.maxFinite,
              height: double.infinity,
              color: Colors.black54.withOpacity(0.5),
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  padding: EdgeInsets.all(30),
                  color: Colors.white,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.black,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
