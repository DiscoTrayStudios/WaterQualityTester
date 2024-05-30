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
  bool get isStandardMet => widget.standard.isValueInRange(
      widget.standard.swatches[int.parse(widget.controller.text)].value);

  Widget CustomRadioButton(Color wcolor, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.controller.text = index.toString();
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        height: 35.0,
        width: 35.0,
        decoration: BoxDecoration(
            color: wcolor,
            border: Border.all(
              width: widget.standard
                      .isValueInRange(widget.standard.swatches[index].value)
                  ? 1
                  : 2,
              color: widget.standard
                      .isValueInRange(widget.standard.swatches[index].value)
                  ? Colors.grey
                  : Color.fromARGB(255, 248, 3, 3),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: index == double.parse(widget.controller.text)
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
    return
        //Expanded(
        //child:
        Card(
      child: ListTile(
        /*tileColor: isStandardMet
            ? const Color.fromARGB(255, 182, 214, 204)
            : const Color.fromARGB(255, 255, 200, 200),
            */
        title: Container(
          height: 35,
          child: ListView.builder(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              itemCount: widget.standard.swatches.length,
              itemBuilder: (context, index) {
                return CustomRadioButton(
                    widget.standard.swatches[index].color, index);
              }),
        ),
        subtitle: Row(
          children: [
            Text(
                '${widget.standard.name}: ${widget.standard.swatches[int.parse(widget.controller.text)].value}'),
            const Spacer(),
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
