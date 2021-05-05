import 'dart:async';

import 'package:flutter/material.dart';

import '../../../utils/constants/routes.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 2), (_) {
      timer?.cancel();
      Navigator.popAndPushNamed(context, Routes.posts);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Text(
          'Splash Page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    super.dispose();
  }
}
