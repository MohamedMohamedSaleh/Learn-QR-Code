import 'package:flutter/material.dart';
import 'package:tester/qr_scanner.dart';

class ResultScanner extends StatefulWidget {
  const ResultScanner({super.key, required this.model});
  final User model;
  @override
  State<ResultScanner> createState() => _ResultScannerState();
}

class _ResultScannerState extends State<ResultScanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.model.name!,
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              widget.model.address!,
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "${widget.model.id}",
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
