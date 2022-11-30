import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';
import 'pages/RegistrationPage.dart';
import 'pages/HomePage.dart';
import 'pages/LoginPage.dart';
import 'pages/Onboarding.dart';
import 'pages/ProfilePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (await Permission.location.request().isGranted) {
    // Either the permission was already granted before or the user just granted it.
    print("Location Permission is granted");
  } else {
    print("Location Permission is denied.");
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      // initialRoute: Onboarding.id,
      routes: {
        Onboarding.id: (context) => onboarding(),
        LoginPage.id: (context) => loginPage(),
        RegistrationPage.id: (context) => registrationPage(),
        HomePage.id: (context) => homePage(),
        ProfilePage.id: (context) => profilePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 3), openOnBoard);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 52, 71, 68),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/logo.png'),
          )),
        ),
      ),
    );
  }

  void openOnBoard() {
    Navigator.pushNamed(context, Onboarding.id);
  }
}
