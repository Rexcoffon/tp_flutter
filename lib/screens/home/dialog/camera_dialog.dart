import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraDialog extends StatefulWidget {
  @override
  _CameraDialogState createState() => _CameraDialogState();
}

class _CameraDialogState extends State<CameraDialog> {
  // déclaration des variables
  List<CameraDescription>? cameras;
  CameraController? controller;
  XFile? imageFile;

  //charger les cameras
  Future initCameras() async {
    cameras = await availableCameras();
    controller = CameraController(cameras![0], ResolutionPreset.medium);
    controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
    print(cameras);
  }

  //methode qui va etre appelé à l'initlisation du widget
  @override
  void initState() {
    initCameras();
    super.initState();
  }

  //à la destruction du widget
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  // fonction pour prendre une photo

  Future<XFile> takePicture() async {
    if (!controller!.value.isInitialized) {
      throw 'error';
    }

    if (controller!.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      throw 'error';
    }

    try {
      XFile file = await controller!.takePicture();
      return file;
    } on CameraException catch (e) {
      throw e;
    }
  }

//fonction appelé à l'appui du bouton
  void onTakePictureButtonPressed(context) async {
    takePicture().then((XFile file) {
      print('take a picture');
      print(file);
      setState(() {
        imageFile = file;
        Navigator.of(context).pop(imageFile);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedOpacity(
        duration: Duration(seconds: 1),
        opacity: controller == null ? 0 : 1,
        curve: Curves.easeInCubic,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 20,
          child: Stack(
            children: [
              //Partie Camera

              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: AspectRatio(
                      aspectRatio: 0.7,
                      child: controller == null
                          ? Container()
                          : CameraPreview(controller!)),
                ),
              ),

              //Bouton de la caméra
              Positioned(
                bottom: 30,
                right: 30,
                child: IconButton(
                    color: Colors.white,
                    onPressed: () => onTakePictureButtonPressed(context),
                    icon: Icon(
                      Icons.camera,
                      size: 50,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
