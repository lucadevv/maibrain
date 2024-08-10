import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maibrain/firebase_options.dart';
import 'package:maibrain/main/main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final firebaseInstance = FirebaseFirestore.instance;
  runApp(MainApp(
    firebaseFirestore: firebaseInstance,
  ));
}
