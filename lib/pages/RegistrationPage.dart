import 'package:flutter/material.dart';
import '../components/buttondecor.dart';
import 'HomePage.dart';

class RegistrationPage extends StatelessWidget {
  static const String id = 'registration_page';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: registrationPage(),
    );
  }
}

class registrationPage extends StatefulWidget {
  @override
  _registrationPageState createState() => _registrationPageState();
}

class _registrationPageState extends State<registrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 52, 71, 68),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'logo',
              child: SizedBox(
                height: 150.0,
                width: 450,
                child: Image.asset('assets/images/logosmall.png'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontFamily: 'Oswald',
              ),
            ),
            // const Text(
            //   "Sign in to continue...",
            //   style: TextStyle(fontSize: 18, color: Colors.grey),
            // ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "User Name",
              style: TextStyle(
                fontSize: 23,
                color: Colors.white,
                fontFamily: 'Nunito',
              ),
            ),
            const TextField(
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: "Enter Username",
                hintStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.w100,
                  fontFamily: 'ProductSans',
                ),
              ),
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'ProductSans',
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Password",
              style: TextStyle(
                fontSize: 23,
                color: Colors.white,
                fontFamily: 'Nunito',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: "Enter Password",
                hintStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w100,
                  color: Colors.grey,
                  fontFamily: 'ProductSans',
                ),
              ),
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'ProductSans',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: "Re-Enter Password",
                hintStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w100,
                  color: Colors.grey,
                  fontFamily: 'ProductSans',
                ),
              ),
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'ProductSans',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ButtonDecor(
                width: 257,
                height: 59,
                title: 'Sign Up',
                onPressed: () {
                  Navigator.pushNamed(context, HomePage.id);
                },
                colour: const Color.fromARGB(255, 84, 160, 56),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sign Up Using: ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'ProductSans',
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Image.asset(
                    'assets/images/googlelogo.png',
                    width: 20,
                    height: 20,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
