import 'package:flutter/material.dart';

class CSElement {
  const CSElement({
    required this.color,
    required this.value,
  });

  final Color color;

  final double value;
}

/// A range-based standard for determining the validity of measurements of a
/// given chemical.
class ChemicalStandard {
  const ChemicalStandard({
    required this.name,
    required this.lo,
    required this.hi,
    required this.description,
    required this.swatches,
    this.units,
  });

  /// The chemical name for this standard, e.g. 'Lead' or 'pH'.
  final String name;

  /// The range of values accepted by this standard.
  ///
  /// Any chemical measurement (measured in the appropriate [units]) less than
  /// [lo] or greater than [hi] is considered invalid by this standard.
  final double lo, hi;

  /// A detailed description/explanation of this standard.
  final String? description;

  /// The units of measurement in use.
  ///
  /// If left `null`, then it is assumed that no units are necessary, such as
  /// for pH.
  final String? units;

  final List<CSElement> swatches;

  /// Returns `true` if [value] is within the acceptable range for this
  /// standard (inclusive of endpoints).
  ///
  /// Assumes that the given value is measured in the correct [units].
  bool isValueInRange(double value) => value >= lo && value <= hi;
}

/// The EPA drinking water standards for each of the chemicals tested by the
/// app.
///
/// Ranges and descriptions come from the Varify EPA Standards Reference Sheet,
/// which can be found in the assets folder at `assets/EPA Standards Reference
/// Sheet.pdf`.
final epaStandards = List<ChemicalStandard>.unmodifiable(const [
  ChemicalStandard(
    name: "pH",
    lo: 6.5,
    hi: 8.5,
    description: "EPA recommended limit: 6.5 - 8.5\n\n"
        "Water with a pH lower than 7 is considered acidic, and water with a "
        "pH above 8.5 is considered basic. A pH of 7 is considered pure, and a "
        "range of 6.5 to 8.5 is recommended.",
    swatches: [
      CSElement(color: Color.fromARGB(255, 225, 126, 113), value: 6.0),
      CSElement(color: Color.fromARGB(255, 228, 137, 122), value: 6.5),
      CSElement(color: Color.fromARGB(255, 232, 155, 113), value: 7.0),
      CSElement(color: Color.fromARGB(255, 239, 184, 125), value: 7.5),
      CSElement(color: Color.fromARGB(255, 223, 198, 113), value: 8.0),
      CSElement(color: Color.fromARGB(255, 195, 194, 116), value: 8.5),
      CSElement(color: Color.fromARGB(255, 175, 185, 115), value: 9.0),
    ],
  ),
  ChemicalStandard(
    name: "Hardness",
    units: "mg/L",
    lo: 0.0,
    hi: 425.0,
    description: "EPA recommended limit: 425 mg/L\n\n"
        "Hardness is the amount of dissolved calcium and magnesium. Soft water "
        "can cause corrosion of your plumbing and appliances. Hard water can "
        "cause residue buildup and difficulties using soap.",
    swatches: [
      CSElement(color: Color.fromARGB(255, 112, 176, 209), value: 0),
      CSElement(color: Color.fromARGB(255, 111, 159, 196), value: 25),
      CSElement(color: Color.fromARGB(255, 114, 148, 189), value: 50),
      CSElement(color: Color.fromARGB(255, 93, 114, 166), value: 100),
      CSElement(color: Color.fromARGB(255, 114, 96, 151), value: 250),
      CSElement(color: Color.fromARGB(255, 131, 85, 142), value: 425),
    ],
  ),
  ChemicalStandard(
    name: "Hydrogen Sulfide",
    units: "mg/L",
    lo: 0.0,
    hi: 0.0,
    description: "EPA recommended limit: 0 mg/L\n\n"
        "Hydrogen Sulfide gas occurs naturally in some groundwater through "
        "decomposing organic matter such as plant decay. Drinking water with "
        "high levels of hydrogen sulfide produces a pungent rotten egg smell. "
        "This can lead to nausea and stomach pain.",
    swatches: [
      CSElement(color: Color.fromARGB(255, 254, 254, 253), value: 0),
      CSElement(color: Color.fromARGB(255, 253, 246, 235), value: 0.5),
      CSElement(color: Color.fromARGB(255, 234, 226, 219), value: 1),
      CSElement(color: Color.fromARGB(255, 231, 217, 199), value: 2),
      CSElement(color: Color.fromARGB(255, 209, 186, 177), value: 3),
      CSElement(color: Color.fromARGB(255, 169, 155, 147), value: 5),
      CSElement(color: Color.fromARGB(255, 109, 95, 89), value: 10),
    ],
  ),
  ChemicalStandard(
    name: "Iron",
    units: "mg/L",
    lo: 0.0,
    hi: 0.3,
    description: "EPA recommended limit: 0.3 mg/L\n\n"
        "Iron is a naturally occuring mineral that can enter your well water "
        "through surrounding soil. It does not pose a threat to your health, "
        "but can cause various complications with your appliances.",
    swatches: [
      CSElement(color: Color.fromARGB(255, 246, 245, 246), value: 0),
      CSElement(color: Color.fromARGB(255, 247, 219, 212), value: 0.3),
      CSElement(color: Color.fromARGB(255, 238, 189, 182), value: 0.5),
      CSElement(color: Color.fromARGB(255, 234, 168, 157), value: 1),
      CSElement(color: Color.fromARGB(255, 223, 124, 94), value: 3),
      CSElement(color: Color.fromARGB(255, 215, 89, 42), value: 5),
    ],
  ),
  ChemicalStandard(
    name: "Copper",
    units: "mg/L",
    lo: 0.0,
    hi: 1.0,
    description: "EPA recommended limit: 1.3 mg/L\n\n"
        "Copper can enter your drinking water through corrosion of pipes or "
        "direct contamination. High levels can cause nausea, vomiting, and "
        "diarrhea.",
    swatches: [
      CSElement(color: Color.fromARGB(255, 247, 227, 160), value: 0),
      CSElement(color: Color.fromARGB(255, 241, 218, 156), value: 0.1),
      CSElement(color: Color.fromARGB(255, 202, 194, 149), value: 0.2),
      CSElement(color: Color.fromARGB(255, 172, 181, 148), value: 0.4),
      CSElement(color: Color.fromARGB(255, 123, 166, 175), value: 1),
      CSElement(color: Color.fromARGB(255, 61, 120, 180), value: 2),
      CSElement(color: Color.fromARGB(255, 26, 73, 142), value: 5),
    ],
  ),
  ChemicalStandard(
    name: "Lead",
    units: "mg/L",
    lo: 0.0,
    hi: 15.0,
    description: "EPA recommended limit: 15 mg/L\n\n"
        "Lead can enter drinking water when your plumbing that contains lead "
        "corrodes. Corrosion of pipes can be caused by acidic water (low pH). "
        "Side effects include damage to the nervous system, infertility, and "
        "decreased kidney function.",
    swatches: [
      CSElement(color: Color.fromARGB(255, 247, 211, 135), value: 0),
      CSElement(color: Color.fromARGB(255, 245, 203, 130), value: 5),
      CSElement(color: Color.fromARGB(255, 243, 192, 129), value: 15),
      CSElement(color: Color.fromARGB(255, 235, 167, 118), value: 30),
      CSElement(color: Color.fromARGB(255, 211, 132, 106), value: 50),
    ],
  ),
  ChemicalStandard(
    name: "Manganese",
    units: "mg/L",
    lo: 0.0,
    hi: 0.1,
    description: "EPA recommended limit: 0.1 mg/L\n\n"
        "Manganese occurs naturally in surface water, although human "
        "activities are also responsible for manganese in drinking water. "
        "Possible side effects are stained clothes/appliances and nerve "
        "damage.",
    swatches: [
      CSElement(color: Color.fromARGB(255, 251, 226, 139), value: 0),
      CSElement(color: Color.fromARGB(255, 233, 157, 132), value: 0.05),
      CSElement(color: Color.fromARGB(255, 231, 159, 142), value: 0.1),
      CSElement(color: Color.fromARGB(255, 200, 113, 135), value: 1),
      CSElement(color: Color.fromARGB(255, 191, 89, 140), value: 2),
      CSElement(color: Color.fromARGB(255, 181, 86, 149), value: 5),
    ],
  ),
  ChemicalStandard(
    name: "Total Chlorine",
    units: "mg/L",
    lo: 0.0,
    hi: 3.0,
    description: "EPA recommended limit: 3 mg/L\n\n"
        "Chlorine is added to drinking water to kill disease causing "
        "pathogens. Total chlorine is the amount of Free Chlorine + Used "
        "Chlorine (Chloramines) in your water. Nausea, diarrhea, and vomiting "
        "are common side effects of ingesting too much chlorine.",
    swatches: [
      CSElement(color: Color.fromARGB(255, 252, 247, 235), value: 0),
      CSElement(color: Color.fromARGB(255, 250, 234, 211), value: 0.5),
      CSElement(color: Color.fromARGB(255, 248, 228, 226), value: 1),
      CSElement(color: Color.fromARGB(255, 246, 220, 222), value: 3),
      CSElement(color: Color.fromARGB(255, 241, 200, 211), value: 5),
      CSElement(color: Color.fromARGB(255, 231, 163, 182), value: 10),
    ],
  ),
  /*ChemicalStandard(
    name: "Mercury",
    units: "mg/L",
    lo: 0.0,
    hi: 0.002,
    description: "EPA recommended limit: 0.002 mg/L\n\n"
        "Mercury is a natrually occuring element that occurs from the "
        "degassing of the earth's crust. High levels can cause kidney damage.",
  ),*/
  ChemicalStandard(
    name: "Free Chlorine",
    units: "mg/L",
    lo: 0.0,
    hi: 3.0,
    description: "help needed",
    swatches: [
      CSElement(color: Color.fromARGB(255, 252, 252, 249), value: 0),
      CSElement(color: Color.fromARGB(255, 237, 246, 246), value: 0.5),
      CSElement(color: Color.fromARGB(255, 210, 231, 233), value: 1),
      CSElement(color: Color.fromARGB(255, 173, 213, 219), value: 3),
      CSElement(color: Color.fromARGB(255, 120, 194, 216), value: 5),
      CSElement(color: Color.fromARGB(255, 77, 173, 201), value: 10),
      CSElement(color: Color.fromARGB(255, 73, 164, 197), value: 20),
    ],
  ),
  ChemicalStandard(
    name: "Nitrate",
    units: "mg/L",
    lo: 0.0,
    hi: 10.0,
    description: "EPA recommended limit: 10 mg/L\n\n"
        "Nitrate is one of the most common groundwater contaminants in "
        "drinking water. It most commonly comes from fertilizer runoff. Excess "
        "amounts can cause blue baby disease - a lack of oxygen to the brain.",
    swatches: [
      CSElement(color: Color.fromARGB(255, 252, 252, 253), value: 0),
      CSElement(color: Color.fromARGB(255, 251, 245, 249), value: 10),
      CSElement(color: Color.fromARGB(255, 247, 231, 241), value: 20),
      CSElement(color: Color.fromARGB(255, 244, 215, 230), value: 50),
      CSElement(color: Color.fromARGB(255, 242, 203, 221), value: 100),
      CSElement(color: Color.fromARGB(255, 235, 186, 210), value: 200),
      CSElement(color: Color.fromARGB(255, 226, 141, 181), value: 500),
    ],
  ),
  ChemicalStandard(
    name: "Nitrite",
    units: "mg/L",
    lo: 0.0,
    hi: 1.0,
    description: "EPA recommended limit: 1 mg/L\n\n"
        "Nitrites come from fertilizers through the runoff of water and sewage "
        "deposits. They can stimulate the growth of harmful bacterias.",
    swatches: [
      CSElement(color: Color.fromARGB(255, 251, 251, 252), value: 0),
      CSElement(color: Color.fromARGB(255, 252, 245, 249), value: 1),
      CSElement(color: Color.fromARGB(255, 244, 217, 230), value: 5),
      CSElement(color: Color.fromARGB(255, 239, 193, 217), value: 10),
      CSElement(color: Color.fromARGB(255, 233, 173, 203), value: 20),
      CSElement(color: Color.fromARGB(255, 216, 118, 166), value: 40),
      CSElement(color: Color.fromARGB(255, 204, 90, 150), value: 60),
    ],
  ),
  ChemicalStandard(
    name: "Sulfate",
    units: "mg/L",
    lo: 0.0,
    hi: 200.0,
    description: "EPA recommended limit: 200 mg/L\n\n"
        "Sulfate is naturally occuring in the earth's sediment and can cause a "
        "laxative effect, as well as clogged plumbing.",
    swatches: [
      CSElement(color: Color.fromARGB(255, 195, 178, 209), value: 0),
      CSElement(color: Color.fromARGB(255, 211, 207, 229), value: 200),
      CSElement(color: Color.fromARGB(255, 212, 213, 225), value: 400),
      CSElement(color: Color.fromARGB(255, 201, 208, 224), value: 800),
      CSElement(color: Color.fromARGB(255, 191, 204, 226), value: 1200),
      CSElement(color: Color.fromARGB(255, 182, 198, 224), value: 1600),
    ],
  ),
  ChemicalStandard(
    name: "Zinc",
    units: "mg/L",
    lo: 0.0,
    hi: 5.0,
    description: "EPA recommended limit: 5 mg/L\n\n"
        "Zinc is an essential nutrient for our bodies, usually introduced into "
        "water by products such as steel production. However, exposure to high "
        "levels can lead to stomach cramps, nausea, and vomiting.",
    swatches: [
      CSElement(color: Color.fromARGB(255, 205, 131, 151), value: 0),
      CSElement(color: Color.fromARGB(255, 204, 132, 169), value: 5),
      CSElement(color: Color.fromARGB(255, 188, 128, 164), value: 10),
      CSElement(color: Color.fromARGB(255, 161, 120, 163), value: 30),
      CSElement(color: Color.fromARGB(255, 120, 128, 185), value: 50),
      CSElement(color: Color.fromARGB(255, 94, 142, 200), value: 100),
    ],
  ),
  ChemicalStandard(
    name: "Flouride",
    units: "mg/L",
    lo: 0.0,
    hi: 4.0,
    description: "EPA recommended limit: 4 mg/L\n\n"
        "Flouride is a natural compound found in many rocks and is added to "
        "public water sources to prevent cavities. Groundwater can contain "
        "high levels of flouride, which can cause dental flourosis and thyroid "
        "problems.",
    swatches: [
      CSElement(color: Color.fromARGB(255, 228, 148, 124), value: 0),
      CSElement(color: Color.fromARGB(255, 230, 156, 128), value: 2),
      CSElement(color: Color.fromARGB(255, 234, 166, 126), value: 4),
      CSElement(color: Color.fromARGB(255, 237, 174, 123), value: 10),
      CSElement(color: Color.fromARGB(255, 238, 184, 114), value: 25),
      CSElement(color: Color.fromARGB(255, 245, 199, 103), value: 50),
      CSElement(color: Color.fromARGB(255, 249, 215, 95), value: 100),
    ],
  ),
  ChemicalStandard(
    name: "Sodium Chloride",
    units: "mg/L",
    lo: 0.0,
    hi: 250.0,
    description: "EPA recommended limit: 250 mg/L\n\n"
        "Sodium Chloride increases the electrical conductivity of water and "
        "thus increases its corrosivity. In metal pipes, chloride reacts with "
        "metal ions to form soluble salts, thus increasing levels of metals in "
        "drinking-water.",
    swatches: [
      CSElement(color: Color.fromARGB(255, 192, 118, 100), value: 0),
      CSElement(color: Color.fromARGB(255, 197, 128, 108), value: 50),
      CSElement(color: Color.fromARGB(255, 196, 128, 112), value: 100),
      CSElement(color: Color.fromARGB(255, 207, 139, 123), value: 250),
      CSElement(color: Color.fromARGB(255, 219, 172, 153), value: 500),
      CSElement(color: Color.fromARGB(255, 239, 212, 186), value: 1000),
      CSElement(color: Color.fromARGB(255, 246, 245, 204), value: 2000),
    ],
  ),
  ChemicalStandard(
    name: "Total Alkalinity",
    units: "mg/L",
    lo: 40.0,
    hi: 180.0,
    description: "EPA recommended limit: 40 - 180 mg/L\n\n"
        "Alkalinity is the level of dissolved minerals in your water that help "
        "neutralize acidity. Water with low levels of alkalinity is more "
        "likely to be corrosive, and high levels can cause scaling.",
    swatches: [
      CSElement(color: Color.fromARGB(255, 248, 220, 139), value: 0),
      CSElement(color: Color.fromARGB(255, 224, 209, 138), value: 40),
      CSElement(color: Color.fromARGB(255, 193, 187, 133), value: 80),
      CSElement(color: Color.fromARGB(255, 154, 178, 133), value: 120),
      CSElement(color: Color.fromARGB(255, 70, 130, 125), value: 180),
      CSElement(color: Color.fromARGB(255, 45, 106, 128), value: 240),
    ],
  ),
]);
