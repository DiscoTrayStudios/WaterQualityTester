import 'dart:io';
import 'package:flutter/material.dart';

import 'package:water_quality_app/pages/results.dart';

// RGB class storing all RGB information from image file
class RGBImageCheckPage extends StatelessWidget {
  // image from camera
  final File image;

  const RGBImageCheckPage(
      {super.key,
      required this.image,
      required this.waterType,
      required this.waterInfo});

  final String waterType;
  final String waterInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 400,
                child: Image(image: FileImage(image)),
              ),
              ElevatedButton(
                child: const Text("Enter Results"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultsPage(
                                image: image,
                                waterType: waterType,
                                waterInfo: waterInfo,
                              )));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
