import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:water_quality_app/objects/chemical_standard.dart';

class ChemicalResultListing extends StatefulWidget {
  const ChemicalResultListing(
      {super.key, required this.standard, required this.controller});
  final ChemicalStandard standard;
  final TextEditingController controller;

  @override
  State<ChemicalResultListing> createState() => _ChemicalResultListingState();
}

class _ChemicalResultListingState extends State<ChemicalResultListing> {
  bool get isStandardMet =>
      widget.standard.isValueInRange(double.parse(widget.controller.text));
  int value = 0;

  Widget CustomRadioButton(Color wcolor, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          value = index;
        });
      },
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
            color: wcolor,
            border: Border.all(
              color: value == index ? Colors.black : Colors.white,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: index == value
            ? Icon(Icons.check,
                color: wcolor.computeLuminance() > 0.179
                    ? Colors.black
                    : Colors.white)
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const resultColor = Color.fromARGB(255, 6, 6, 6);

    return
        //Expanded(
        //child:
        Card(
      child: ListTile(
        tileColor: isStandardMet
            ? const Color.fromARGB(255, 182, 214, 204)
            : const Color.fromARGB(255, 255, 200, 200),
        title: Row(
          children: [
            CustomRadioButton(Colors.red, 1),
            const SizedBox(width: 10),
            CustomRadioButton(Colors.green, 2),
            const SizedBox(width: 10),
            CustomRadioButton(Colors.blue, 3),
            const SizedBox(width: 10),
            CustomRadioButton(Colors.black, 4),
            const SizedBox(width: 10),
          ],
        ),
        subtitle: Row(
          children: [
            const Spacer(),
            Text(widget.standard.name),
            const SizedBox(width: 10),
            Text(
                'Ideal: ${widget.standard.lo}-${widget.standard.hi} ${widget.standard.units ?? ''}'),
          ],
        ),
        onTap: () => widget.standard.description == null
            ? null
            : showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(widget.standard.name),
                  content: Text(widget.standard.description ?? ''),
                  actions: [
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('back'),
                    ),
                  ],
                ),
              ),
      ),
      //),
    );
  }
}
