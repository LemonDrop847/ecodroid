// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:ecodroid/components/buttondecor.dart';
import 'LoginPage.dart';
import 'RegistrationPage.dart';

class Onboarding extends StatelessWidget {
  static const String id = 'onboarding';

  const Onboarding({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: const onboarding(),
    );
  }
}

class onboarding extends StatefulWidget {
  const onboarding({super.key});

  @override
  _onboardingState createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 52, 71, 68),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: SizedBox(
                height: 350.0,
                width: 450,
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            const Center(
              child: Text(
                '"Saving Trees for a greener future"',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: 'Itim',
                ),
              ),
            ),
            const SizedBox(
              height: 140.0,
            ),
            ButtonDecor(
              width: 257,
              height: 59,
              title: 'Login',
              onPressed: () {
                Navigator.pushNamed(context, LoginPage.id);
              },
              colour: const Color.fromARGB(255, 84, 160, 56),
            ),
            MaterialButton(
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                      fontFamily: 'Nunito'),
                  children: <TextSpan>[
                    TextSpan(text: 'New to EcoDroid? '),
                    TextSpan(
                        text: 'Sign Up Here',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, RegistrationPage.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
