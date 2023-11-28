import 'package:flutter/material.dart';
import 'widgets/HomeDrawer.dart';
import 'widgets/HomeScreenBody.dart';
import 'widgets/homeAppBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: homeAppBar(context),
      body: const HomeScreenBody(),
    );
  }
}
