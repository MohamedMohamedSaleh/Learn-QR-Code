import 'package:flutter/material.dart';
import 'package:tester/qr_image.dart';
import 'package:tester/qr_scanner.dart';

class QRCode extends StatefulWidget {
  const QRCode({super.key});

  @override
  State<QRCode> createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "QR Code",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              labelText: "Enter your URL",
            ),
          ),
        ),
        FilledButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QRCodeImage(controller: controller),
                ));
          },
          child: const Text("Create QR Code"),
        ),
        FilledButton(
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const QRScanner(),
              ),
            );
          },
          child: const Text("Scan QR Code"),
        ),
      ]),
    );
  }
}
