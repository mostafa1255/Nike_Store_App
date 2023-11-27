import 'package:flutter/material.dart';

import 'widgets/LoginScreenBody.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const LoginScreenBody());
  }
}
