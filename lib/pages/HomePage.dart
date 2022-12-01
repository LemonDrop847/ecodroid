import 'package:flutter/material.dart';

import 'MapsPage.dart';
import 'ProfilePage.dart';
import 'ReportPage.dart';
import 'RewardsPage.dart';

class HomePage extends StatelessWidget {
  static const String id = 'home_page';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homePage(),
    );
  }
}

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, MapsPage.id);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 30),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: const Color.fromARGB(255, 46, 140, 17),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 9),
                          blurRadius: 20,
                          spreadRadius: 3,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.asset('assets/images/maplogo.png'),
                        ),
                        const Center(
                          child: Text(
                            textDirection: TextDirection.ltr,
                            'Map Locations',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'Oswald',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ReportPage.id);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: const Color.fromARGB(255, 46, 140, 17),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 9),
                          blurRadius: 20,
                          spreadRadius: 3,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.asset('assets/images/report.png')),
                        const Center(
                          child: Text(
                            'Report Issues | Problems',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'Oswald',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RewardsPage.id);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: const Color.fromARGB(255, 46, 140, 17),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0, 9),
                      blurRadius: 20,
                      spreadRadius: 3,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/images/rewards.png')),
                    const Center(
                      child: Text(
                        'Points Shop Rewards',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: 'Oswald',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 400,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: const Color.fromARGB(255, 46, 140, 17),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0, 9),
                      blurRadius: 20,
                      spreadRadius: 3,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Tasks Due',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Card(
                      color: Color.fromARGB(255, 52, 113, 62),
                      child: Text(
                        'Plant A Tree',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: 'Itim',
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                    Card(
                      color: Color.fromARGB(255, 52, 113, 62),
                      child: Text(
                        'Report Status of a Particular Plant',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: 'Itim',
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                    Card(
                      color: Color.fromARGB(255, 52, 113, 62),
                      child: Text(
                        'Participate in a Plantation Drive',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: 'Itim',
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                    Card(
                      color: Color.fromARGB(255, 52, 113, 62),
                      child: Text(
                        'Refer Friends',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: 'Itim',
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
