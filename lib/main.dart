import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_store_app/app/core/Functions/initHive.dart';
import 'package:nike_store_app/app/core/Functions/listenForChangesProducts.dart';
import 'package:nike_store_app/app/core/Functions/setUp_Service_Locator.dart';
import 'package:nike_store_app/firebase_options.dart';
import 'NikeStoreApp.dart';
import 'app/core/Functions/setupNotification.dart';
import 'app/core/Functions/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initHive();
  Bloc.observer = SimpleBlocObserver();
  setupNotification();
  setUpServiceLocator();
  listenForChangesProducts();
  runApp(const NikeStoreApp());
}
