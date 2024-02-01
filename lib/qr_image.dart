import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeImage extends StatelessWidget {
  const QRCodeImage({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "QR Image",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: QrImageView(
        // backgroundColor: Colors.red, =>
        // foregroundColor: Colors.red, => color
        gapless: false, // change shape to square
        // eyeStyle: QrEyeStyle(color: Colors.red),
        data: controller.text,
        size: 300,
        embeddedImageStyle: const QrEmbeddedImageStyle(
          size: Size(100, 100),
          color: Colors.red,
        ),
      )),
    );
  }
}
