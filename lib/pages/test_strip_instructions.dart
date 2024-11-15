import 'package:flutter/material.dart';
import 'package:water_quality_app/pages/camera_instructions.dart';
import 'package:water_quality_app/widgets/buttons.dart';
import 'package:water_quality_app/widgets/instructions.dart';

class WaterInstructionPage extends StatelessWidget {
  WaterInstructionPage(
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
            title: const Text("Testing Strip",
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
                color: const Color(0xffF9D5B4),
                child: const Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Text("water test strip instructions",
                          style: TextStyle(
                              fontFamily: "Comfortaa",
                              fontSize: 20,
                              fontWeight: FontWeight.w700))),
                  SizedBox(
                    height: 20,
                  ),
                  Instructions(
                      number: "1", text: "Remove one test strip from package"),
                  SizedBox(
                    height: 10,
                  ),
                  Instructions(
                      number: "2",
                      text:
                          "Submerge test strip in water source or into a cup of water from the water source"),
                  SizedBox(
                    height: 10,
                  ),
                  Instructions(
                      number: "3",
                      text: "Within 60 seconds take a picture of test strip"),
                  SizedBox(
                    height: 10,
                  ),
                  Instructions(
                      number: "4",
                      text: "After 60 seconds dispose of test strip"),
                  SizedBox(
                    height: 10,
                  ),
                ])),
            const SizedBox(height: 20),
            NavButton(
                text: "next",
                icon: Icons.arrow_forward_outlined,
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CameraInstructionPage(
                        waterType: waterType,
                        waterInfo: waterInfo,
                      ),
                    ),
                    (route) => false,
                  );
                }),
          ],
        ));
  }
}
