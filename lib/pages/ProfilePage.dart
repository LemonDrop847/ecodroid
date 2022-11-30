import 'package:flutter/material.dart';

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
        title: Hero(
          tag: 'logo',
          child: SizedBox(
            height: 80.0,
            width: 400,
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: SizedBox(
                    width: 360,
                    height: 360,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/prp.png',
                      ),
                    ),
                  ),
                ),
                Column(
                  children: const [
                    Text(
                      "Name",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontFamily: 'Oswald',
                      ),
                    ),
                    Text(
                      "UserName",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'ProductSans',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Center(
              child: InkWell(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: const Offset(0, 9),
                        blurRadius: 20,
                        spreadRadius: 3)
                  ]),
                  child: const Text(
                    "Points Earned:",
                    style: TextStyle(fontSize: 16, fontFamily: 'Avenir'),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Email:",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontFamily: 'Nunito',
                  ),
                ),
                InkWell(
                  child: Text(
                    'random@ramdom.com ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: 'ProductSans',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Phone No:",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontFamily: 'Nunito',
                  ),
                ),
                InkWell(
                  child: Text(
                    '123456789 ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: 'ProductSans',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "City:",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontFamily: 'Nunito',
                  ),
                ),
                InkWell(
                  child: Text(
                    'BBSR ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: 'ProductSans',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 175,
            ),
            Center(
              child: InkWell(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  child: const Text(
                    "Contact : lemondrop@gmail.com         Phone: 858585859",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: 'Avenir',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
