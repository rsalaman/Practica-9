import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vacheck/shared/nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  bool _initialized = false;
  bool _error = false;
  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vacheck',
      navigatorKey: navigatorKey,
      initialRoute:'nav',
      routes:{
        'nav': (context) => Nav(),
      },
      theme: ThemeData(
        primaryColor: Colors.red[400],
      ),
    );
  }
  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
    // Wait for Firebase to initialize
    //and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
    // Set `_error` state to true if Firebase
    //initialization fails
      setState(() {
        _error = true;
      });
    }
  }
}


