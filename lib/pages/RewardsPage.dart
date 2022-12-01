import 'package:flutter/material.dart';

import 'MapsPage.dart';
import 'ProfilePage.dart';
import 'ReportPage.dart';

class RewardsPage extends StatelessWidget {
  static const String id = 'rewards_page';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: rewardsPage(),
    );
  }
}

class rewardsPage extends StatefulWidget {
  @override
  _rewardsPageState createState() => _rewardsPageState();
}

class _rewardsPageState extends State<rewardsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 52, 71, 68),
      // ignore: prefer_const_constructors
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color.fromARGB(49, 91, 91, 91),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 40,
            ),
            Hero(
              tag: 'logo',
              child: SizedBox(
                height: 100.0,
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, ProfilePage.id);
                },
                icon: const Icon(Icons.person))
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, ReportPage.id);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Color.fromARGB(255, 68, 121, 51),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 9),
                  blurRadius: 20,
                  spreadRadius: 3,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 300,
                  child: Image.asset(
                    height: 100,
                    width: 300,
                    'assets/images/c0.png',
                  ),
                ),
                const Text(
                  '100 Points',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: 'Oswald',
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Color.fromARGB(255, 68, 121, 51),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 9),
                  blurRadius: 20,
                  spreadRadius: 3,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 300,
                  child: Image.asset(
                    height: 100,
                    width: 300,
                    'assets/images/c1.jpg',
                  ),
                ),
                const Text(
                  '40 Points',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: 'Oswald',
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Color.fromARGB(255, 68, 121, 51),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 9),
                  blurRadius: 20,
                  spreadRadius: 3,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 300,
                  child: Image.asset(
                    height: 100,
                    width: 300,
                    'assets/images/c2.png',
                  ),
                ),
                const Text(
                  '70 Points',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: 'Oswald',
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Color.fromARGB(255, 68, 121, 51),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 9),
                  blurRadius: 20,
                  spreadRadius: 3,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 300,
                  child: Image.asset(
                    height: 100,
                    width: 300,
                    'assets/images/c3.jpg',
                  ),
                ),
                const Text(
                  '60 Points',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: 'Oswald',
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
