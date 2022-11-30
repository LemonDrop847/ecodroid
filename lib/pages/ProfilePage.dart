import 'package:flutter/material.dart';
import '../components/buttondecor.dart';
import 'HomePage.dart';

class ProfilePage extends StatelessWidget {
  static const String id = 'profile_page';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: profilePage(),
    );
  }
}

class profilePage extends StatefulWidget {
  @override
  _profilePageState createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
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
              "Welcome Back!",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {},
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: 'ProductSans',
                    ),
                  ),
                )
              ],
            ),
            Center(
              child: ButtonDecor(
                width: 257,
                height: 59,
                title: 'Log In',
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
                  'Log In Using: ',
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
