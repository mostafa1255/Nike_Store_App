import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_store_app/firebase_options.dart';
import 'NikeStoreApp.dart';
import 'app/core/Functions/setupNotification.dart';
import 'app/core/Functions/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  setupNotification();

  runApp(const NikeStoreApp());
}
