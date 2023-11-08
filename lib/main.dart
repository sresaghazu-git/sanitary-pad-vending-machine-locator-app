import 'package:flutter/material.dart';
import 'package:sanitary_pad_vending_machine_locator_app/screens/homepage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_option.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sanitary Pad Vending Machine Locator App',
      // initialRoute: '/', // Set the initial route
      theme: ThemeData(
        // Define your app's theme here.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(), // Set HomeScreen as the initial screen.
    );
  }
}
