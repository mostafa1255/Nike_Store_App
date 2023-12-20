import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nike_store_app/firebase_options.dart';
import 'NikeStoreApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const NikeStoreApp());
}
