import 'dart:io';
import 'package:flutter/material.dart';

import 'package:water_quality_app/pages/results.dart';
import 'package:water_test_scanner/water_test_scanning.dart';

// RGB class storing all RGB information from image file
class RGBImageCheckPage extends StatelessWidget {
  // image from camera
  final File image;

  const RGBImageCheckPage(
      {super.key, required this.image, required this.result});

  final ColorDetectionResult result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            result.image,
            ElevatedButton(
              child: const Text("View Results"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResultsPage(results: result)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
