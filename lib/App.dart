// ignore_for_file: unused_import
import 'package:flutter/material.dart';

import 'screen/HomeScreen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sözlük',
      theme: ThemeData(
        fontFamily: 'Podkova',
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
