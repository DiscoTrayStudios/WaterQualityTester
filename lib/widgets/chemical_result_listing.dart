import 'package:flutter/material.dart';

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
    double value = index == -1 ? -1 : widget.standard.swatches[index].value;

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
              width: widget.standard.isValueInRange(value) ? 1 : 2,
              color: widget.standard.isValueInRange(value)
                  ? Colors.grey
                  : const Color.fromARGB(255, 248, 3, 3),
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
    String selectedValue = int.parse(widget.controller.text) == -1
        ? "N/A"
        : "${widget.standard.swatches[int.parse(widget.controller.text)].value}";

    return Card(
      child: ListTile(
        title: SizedBox(
          height: 35,
          child: ListView.builder(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              itemCount: widget.standard.swatches.length + 1,
              itemBuilder: (context, index) {
                return CustomRadioButton(
                    index == 0
                        ? Colors.black
                        : widget.standard.swatches[index - 1].color,
                    index - 1);
              }),
          //CustomRadioButton(Colors.black, 0),
        ),
        subtitle: Row(
          children: [
            Text('${widget.standard.name}: $selectedValue'),
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
    );
  }
}
