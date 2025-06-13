import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class cameraPage extends StatefulWidget {
  const cameraPage({super.key});

  @override
  State<cameraPage> createState() => _cameraPageState();

}

class _cameraPageState extends State<cameraPage> {
  CameraController? _cameraController;
  late Future<void> _initializeControllerFuture = Future.value();

  
  @override
  void initState() {
    super.initState();
    _initApp();
  }

 void _initApp() async {
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  final controller = CameraController(
    firstCamera,
    ResolutionPreset.high,
  );
  final future = controller.initialize();
  setState(() {
    _cameraController = controller;
    _initializeControllerFuture = future;
  });
}
  
  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Camera Page'),
    ),
    body: Column(
       children: [
        /*IconButton(onPressed: () async{
          try{
            await _initializeControllerFuture;
            final image = await _cameraController?.takePicture();
            if(!context.mounted) return;
            if(image != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PreviewPictureScreen(
                    imagePath: image.path),
                ),
              );
            }
          }catch(e){
            print(e);
          }
        }, icon: Icon(Icons.camera_alt)),
        */
        IconButton(onPressed: () async{
          try{
            await _initializeControllerFuture;
            final image = await _cameraController?.takePicture();
            if(!context.mounted) return;
            if(image != null) {
              Navigator.pop(context,image.path);
            }
          }catch(e){
            print(e);
          }
        }, icon: Icon(Icons.send)),

       ],
      
    ),
  );
  }
}

class PreviewPictureScreen extends StatelessWidget {
 final String imagePath;
 const PreviewPictureScreen({super.key, required this.imagePath});
 @override
 Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Vista previa')),
    body: Image.file(File(imagePath)),
  );
 }
}