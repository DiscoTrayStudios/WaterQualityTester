import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:water_quality_app/pages/source_description.dart';
import 'firebase_options.dart';
import 'package:water_quality_app/firebase.dart' as firebase;

import 'objects/app_state.dart';

List<CameraDescription> cameras = [];
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  try {
    cameras = await availableCameras();
    final userCredential = await FirebaseAuth.instance.signInAnonymously();
    debugPrint("Signed in with temp account");
    debugPrint(userCredential.user!.uid); //user id for anonymous account
    firebase.userID =
        userCredential.user!.uid; //save the user's uid for use in the database
  } on CameraException catch (e) {
    debugPrint('Error in fetching the cameras: $e');
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case "operation-not-allowed":
        debugPrint("Anonymous auth hasn't been enabled for this project.");
        break;
      default:
        debugPrint("Unknown error.");
        debugPrint(e.code);
    }
  }
  runApp(ChangeNotifierProvider(
    create: ((context) => AppState(FirebaseFirestore.instance, FirebaseAuth.instance, FirebaseStorage.instance)),
    child: MaterialApp(
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: const SourceDescriptionPage(),
  )));
}
