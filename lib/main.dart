import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nike_store_app/app/core/utils/global_variable.dart';
import 'package:nike_store_app/app/data/models/Products_Model.dart';
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
  initHive();
  runApp(const NikeStoreApp());
}

void initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductsModelAdapter());
  await Hive.openBox(GloblaVariable.kAllProducts);
  await Hive.openBox(GloblaVariable.kOutDoorProducts);
  await Hive.openBox(GloblaVariable.kTennisProducts);
}
