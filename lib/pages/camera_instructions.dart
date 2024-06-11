import 'package:flutter/material.dart';
import 'package:water_quality_app/widgets/camera.dart';
import 'package:water_quality_app/widgets/instructions.dart';

class CameraInstructionPage extends StatelessWidget {
  CameraInstructionPage(
      {super.key, required this.waterType, required this.waterInfo});

  final String waterType;
  final String waterInfo;

  // style elevated button
  final ButtonStyle styleButton = ElevatedButton.styleFrom(
      //textStyle: const TextStyle(fontSize: 20, color: Colors.white),
      backgroundColor: const Color.fromRGBO(
          123, 231, 96, 1)); // I want to make this button stand out

  // style cards for listview
  final EdgeInsets margin = const EdgeInsets.symmetric(vertical: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color(0xffB6D6CC),
            title: const Text("camera instructions",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Comfortaa"))),
        // to scroll through page
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Container(
                color: const Color(0xffDDCFD9),
                child: const Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Text("camera instructions",
                            style: TextStyle(
                                fontFamily: "Comfortaa",
                                fontSize: 20,
                                fontWeight: FontWeight.w700))),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      // this tile needs to stand out
                      title: Text("Note: TAKE PICTURES USING A DARK BACKGROUND",
                          style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              fontFamily: "Sans")),
                    ),
                    SizedBox(height: 10),
                    Instructions(
                        number: "1",
                        text: "Use the camera in a VERTICAL ORIENTATION"),
                    SizedBox(height: 10),
                    Instructions(
                        number: "2",
                        text:
                            "Lineup the water test strip within the border of the overlay"),
                    SizedBox(height: 10),
                    Instructions(
                      number: "3",
                      text:
                          "IMPORTANT!!! Put the white part of the test strip at the very top of the image preview",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Instructions(
                      number: "4",
                      text:
                          "Make sure to use a DARK background (preferably black)",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                )),
            const SizedBox(height: 20),
            SizedBox(
                child: Column(
                    //height: 100.0,
                    //width: 18.0,
                    children: [
                  Ink(
                    decoration: const ShapeDecoration(
                      color: Color(0xffB6D6CC),
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      key: const Key('cameraButton'),
                      padding: const EdgeInsets.all(10),
                      color: Colors.black,
                      icon: const Icon(Icons.camera_alt),
                      iconSize: 60,
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CameraPage(
                                  waterType: waterType, waterInfo: waterInfo),
                            ),
                            (route) => false);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "open camera",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: "Comfortaa"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ])),
          ],
        ));
  }
}
