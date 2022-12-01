import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:water_quality_app/begin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//initialize an instance of cloud firestore
final db = FirebaseFirestore.instance;

//init database collections
final pHCollection = db.collection('pH');
final ZincCollection = FirebaseFirestore.instance.collection('Zinc');
final TotalChlorineCollection =
    FirebaseFirestore.instance.collection('TotalChlorine');
final TotalAlkalineCollection =
    FirebaseFirestore.instance.collection('TotalAlkaline');
final SulfateCollection = FirebaseFirestore.instance.collection('Sulfate');
final SodiumChlorideCollection =
    FirebaseFirestore.instance.collection('SodiumChloride');
final NitriteCollection = FirebaseFirestore.instance.collection('Nitrite');
final NitrateCollection = FirebaseFirestore.instance.collection('Nitrate');
final ManganeseCollection = FirebaseFirestore.instance.collection('Manganese');
final LeadCollection = FirebaseFirestore.instance.collection('Lead');
final HydrogenSulfideCollection =
    FirebaseFirestore.instance.collection('HydrogenSulfide');
final FreeChlorineCollection =
    FirebaseFirestore.instance.collection('FreeChlorine');
final FlourideCollection = FirebaseFirestore.instance.collection('Flouride');
final CopperCollection = FirebaseFirestore.instance.collection('Copper');

class Firestore { //a class for firestore functions 
  static Future addMeasurement(String collection, Map<String, int> data) async {
    await FirebaseFirestore.instance.collection(collection).add(data);
  } //need to add uid as field, adds a document to collection
}