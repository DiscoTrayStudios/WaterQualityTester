import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uuid/uuid.dart';

/// The state of the app, containing globally used variables and functions.
class AppState extends ChangeNotifier {
  FirebaseAuth auth;

  FirebaseFirestore firestore;

  FirebaseStorage storage;

  GeoFlutterFire geo = GeoFlutterFire();

  AppState(this.firestore, this.auth, this.storage);

  Future<void> addStrip(
      File image,
      List<double> colors,
      Position loc,
      String waterType,
      String waterInfo,
      String notes,
      DateTime timestamp) async {
    var record = firestore.collection("testInstances");
    final imageLink = await uploadImage(image);
    record.doc().set(toFirebaseRecord(imageLink, colors, loc.latitude,
        loc.longitude, waterType, waterInfo, notes, timestamp));
  }

  Map<String, dynamic> toFirebaseRecord(
      String imageLink,
      List<double> colors,
      double latitude,
      double longitude,
      String waterType,
      String waterInfo,
      String notes,
      DateTime timestamp) {
    return {
      "image": imageLink,
      "timestamp": timestamp.microsecondsSinceEpoch,
      "latitude": latitude,
      "longitude": longitude,
      "Water Type": waterType,
      "Water Info": waterInfo,
      "Notes": notes,
      "pH": colors[0],
      "Hardness": colors[1],
      "Hydrogen Sulfide": colors[2],
      "Iron": colors[3],
      "Copper": colors[4],
      "Lead": colors[5],
      "Manganese": colors[6],
      "Total Chlorine": colors[7],
      // Is it really?
      "Mercury": colors[8],
      "Nitrate": colors[9],
      "Nitrite": colors[10],
      "Sulfate": colors[11],
      "Zinc": colors[12],
      "Flouride": colors[13],
      "Sodium Chloride": colors[14],
      "Total Alkalinity": colors[15]
    };
  }

  Future<String> uploadImage(File imFile) async {
    final id = const Uuid().v1();
    final storageRef = storage.ref();
    final imageRef = storageRef.child(id);
    try {
      await imageRef.putFile(imFile);
    } on FirebaseException catch (_) {
      // ...
    }
    return await imageRef.getDownloadURL();
  }
}
