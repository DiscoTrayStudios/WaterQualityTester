import 'dart:io';

import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import 'package:water_quality_app/objects/chemical_standard.dart'
    show epaStandards;
import 'package:water_quality_app/pages/source_description.dart';
import 'package:water_quality_app/widgets/buttons.dart';
import 'package:water_quality_app/widgets/chemical_result_listing.dart';

import '../objects/app_state.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage(
      {super.key,
      required this.image,
      required this.waterType,
      required this.waterInfo});

  final File image;

  final String waterType;
  final String waterInfo;

  @override
  State<ResultsPage> createState() => _ResultsPagePageState();
}

class _ResultsPagePageState extends State<ResultsPage> {
  List<TextEditingController> textFieldControllers = List.empty(growable: true);

  static const resultsPageTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: 'Comfortaa',
  );

  // created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value) {
      debugPrint(value.toString());
    }).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      debugPrint("ERROR $error");
    });
    debugPrint("requested permissions");
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        timeLimit: const Duration(seconds: 15),
        forceAndroidLocationManager: true);
  }

  @override
  Widget build(BuildContext context) {
    if (textFieldControllers.length < 16) {
      for (var i = 0; i < 16; i++) {
        textFieldControllers.add(TextEditingController(text: "0"));
      }
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 182, 214, 204),
        leading: IconButton(
          iconSize: 32,
          icon: const Icon(Icons.home_outlined),
          onPressed: () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => const SourceDescriptionPage()),
            (route) => false,
          ),
        ),
        title: const Text(
          'results',
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.w700,
            fontFamily: 'Comfortaa',
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 16, bottom: 10),
            child: Column(
              children: [
                Text(
                  'Click on each tile in the list to learn more',
                  style: resultsPageTextStyle,
                ),
                Text(
                  'about the parameters being measured.',
                  style: resultsPageTextStyle,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 16,
              itemBuilder: (context, index) => ChemicalResultListing(
                standard: epaStandards[index],
                controller: textFieldControllers[index],
              ),
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 7, 79, 87),
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                const Spacer(),
                Consumer<AppState>(builder: (context, appState, child) {
                  return WaterTextButton(
                    text: 'add to database',
                    onPressed: () async {
                      debugPrint("Started to add");
                      Position loc = await getUserCurrentLocation();
                      //Position loc = Position(longitude: 10, latitude: 10, timestamp: DateTime.now(), accuracy: 0, altitude: 0, altitudeAccuracy: 0, heading: 0, headingAccuracy: 0, speed: 0, speedAccuracy: 0);
                      debugPrint(loc.toString());
                      await appState.addStrip(
                          widget.image,
                          textFieldControllers.asMap().entries.map((entry) {
                            int index = entry.key;
                            TextEditingController controller = entry.value;
                            return epaStandards[index]
                                .swatches[int.parse(controller.text)]
                                .value;
                          }).toList(),
                          loc,
                          widget.waterType,
                          widget.waterInfo,
                          DateTime.now());
                      debugPrint("added to database");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SourceDescriptionPage(),
                        ),
                      );
                    },
                  );
                }),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
