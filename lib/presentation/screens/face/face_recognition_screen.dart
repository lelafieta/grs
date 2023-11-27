// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final cameras = await availableCameras();
//   final firstCamera = cameras.first;

//   runApp(
//     MaterialApp(
//       home: CameraApp(
//         camera: firstCamera,
//       ),
//     ),
//   );
// }

// class CameraApp extends StatefulWidget {
//   final CameraDescription camera;

//   CameraApp({required this.camera});

//   @override
//   _CameraAppState createState() => _CameraAppState();
// }

// class _CameraAppState extends State<CameraApp> {
//   late CameraController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = CameraController(
//       widget.camera,
//       ResolutionPreset.medium,
//     );

//     _controller.initialize().then((_) {
//       if (!mounted) {
//         return;
//       }
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!_controller.value.isInitialized) {
//       return Container();
//     }
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Câmera Flutter'),
//       ),
//       body: Center(
//         child: CameraPreview(_controller),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Tire uma foto quando o botão for pressionado
//           _takePicture();
//         },
//         child: Icon(Icons.camera_alt),
//       ),
//     );
//   }

//   void _takePicture() async {
//     if (!_controller.value.isInitialized) {
//       return;
//     }

//     try {
//       final XFile file = await _controller.takePicture();
//       // O arquivo da imagem tirada estará disponível em 'file.path'
//       print('Imagem salva em ${file.path}');
//     } catch (e) {
//       print('Erro ao tirar a foto: $e');
//     }
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
