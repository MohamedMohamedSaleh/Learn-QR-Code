import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:tester/result_scanner.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  late Map<String, dynamic> jsonData;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool _isScaned = false;
  late final User model;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              overlay: QrScannerOverlayShape(
                cutOutSize: 250,
                borderWidth: 5,
                borderLength: 30,
                borderColor: Colors.green,
              ),
              key: qrKey,
              onQRViewCreated: onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: result != null
                  ? Text("Result of Scanner: ${result!.code}")
                  : const Text("Scan a Code"),
            ),
          ),
        ],
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen(
      (scanData) {
        if (!_isScaned) {
          result = scanData;
          jsonData = jsonDecode(result!.code ?? "{}");
          model = User.fromJson(jsonData);
          _isScaned = true;
          setState(() {});
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScanner(model: model),
            ),
          );
          
        }
      },
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

class User {
  int? id;
  String? name;
  String? address;

  User.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    address = map['address'];
  }
}
