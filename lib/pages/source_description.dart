import 'package:flutter/material.dart';
import 'package:water_quality_app/pages/test_strip_instructions.dart';
import 'package:water_quality_app/widgets/buttons.dart';

class SourceDescriptionPage extends StatefulWidget {
  const SourceDescriptionPage({Key? key}) : super(key: key);
  @override
  State<SourceDescriptionPage> createState() => _SourceDescriptionPageState();
}

class _SourceDescriptionPageState extends State<SourceDescriptionPage> {
  // style elevated button
  final ButtonStyle styleButton = ElevatedButton.styleFrom(
      //textStyle: const TextStyle(fontSize: 20, color: Colors.white),
      backgroundColor: const Color.fromRGBO(
          123, 231, 96, 1)); // I want to make this button stand out

  String? selectedValue;
  String waterInfo = "";
  final _dropdownFormKey = GlobalKey<FormState>();

  // style cards for listview
  final EdgeInsets margin = const EdgeInsets.symmetric(vertical: 10);
  final TextStyle textstyle = const TextStyle(
      fontSize: 20, fontStyle: FontStyle.italic, fontFamily: "Sans");

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "DW", child: Text("Drinking Water")),
      const DropdownMenuItem(value: "Pond", child: Text("Pond Water")),
      const DropdownMenuItem(value: "SW", child: Text("Surface Water")),
      const DropdownMenuItem(value: "Other", child: Text("Other")),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color(0xffB6D6CC),
            title: const Text("Water Source",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Comfortaa"))),

        // to scroll through page
        body: Center(
            child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SingleChildScrollView(
                      child:
                          // DropDown Box

                          Form(
                              key: _dropdownFormKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: const Color(0xffDDCFD9),
                                    child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const Text(
                                              "Select what type of water source this is",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: "Comfortaa"),
                                            ), // disclaimer should go here about how we are only testing drinking water standards
                                            const SizedBox(height: 20),
                                            DropdownButtonFormField(
                                                decoration: InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.white,
                                                            width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.white,
                                                            width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      const Color(0xffF9D5B4),
                                                ),
                                                validator: (value) => value ==
                                                        null
                                                    ? "Select a water source"
                                                    : null,
                                                dropdownColor: Colors.white,
                                                value: selectedValue,
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    selectedValue = newValue!;
                                                  });
                                                  debugPrint(selectedValue);
                                                },
                                                items: dropdownItems),

                                            const SizedBox(
                                              height: 20,
                                            ),

                                            // Description of water
                                            const Text(
                                              "Describe where you got the water sample from (ie from a sink in your basement vs kitchen...)",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: "Comfortaa"),
                                            ),
                                            TextFormField(
                                              onChanged: (value) {
                                                waterInfo = value;
                                              },
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter some text';
                                                }
                                                return null;
                                              },
                                              decoration: const InputDecoration(
                                                hintText: 'Source Type',
                                                labelText:
                                                    'Describe water source type',
                                              ),
                                            ),

                                            const SizedBox(height: 20),
                                          ],
                                        )),
                                  ),
                                  const SizedBox(height: 10),
                                  // NEXT BUTTON
                                  NavButton(
                                    text: "next",
                                    icon: Icons.arrow_forward,
                                    onPressed: () {
                                      if (_dropdownFormKey.currentState!
                                          .validate()) {
                                        // check to make sure there is an input
                                        if (selectedValue != "DW") {
                                          showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                              title: const Text("Disclaimer",
                                                  style: TextStyle(
                                                      fontFamily: "Comfortaa")),
                                              content: const Text(
                                                  "This only tests water for EPA drinking water standards",
                                                  style: TextStyle(
                                                      fontFamily: "Sans")),
                                              actions: <Widget>[
                                                TextButton(
                                                  //Navigator.pushAndRemoveUntil() (route) => false
                                                  onPressed: () {
                                                    Navigator
                                                        .pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            WaterInstructionPage(
                                                          waterType:
                                                              selectedValue!,
                                                          waterInfo: waterInfo,
                                                        ),
                                                      ),
                                                      (route) => false,
                                                    );
                                                    // then go to the next page
                                                  },
                                                  child: Container(
                                                    color:
                                                        const Color(0xffB6D6CC),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            14),
                                                    child: const Text("OKAY",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Comfortaa",
                                                            color:
                                                                Colors.black)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        } // check to see if it is drinking water
                                        // then add alert dialog box and move on, else move on

                                        else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  WaterInstructionPage(
                                                waterType: selectedValue!,
                                                waterInfo: waterInfo,
                                              ),
                                            ),
                                          );
                                        }
                                      }
                                    },
                                  ),
                                ],
                              )))
                  //)
                  ))
        ])));
  }
}
