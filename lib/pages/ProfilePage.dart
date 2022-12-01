import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  User? user;
  String? uemail = '';
  String? umob = '';
  String? ucity = '';
  String? uname = '';
  int? upoints = 0;
  Timestamp utime = Timestamp.now();

  Future getUser() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          uname = snapshot.data()!["name"];
          umob = snapshot.data()!["mob"];
          utime = snapshot.data()!["created"];
          ucity = snapshot.data()!["city"];
          uemail = snapshot.data()!["email"];
          upoints = snapshot.data()!["points"];
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 52, 71, 68),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: const Color.fromARGB(49, 91, 91, 91),
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
                  radius: 40,
                  backgroundColor: Colors.transparent,
                  child: SizedBox(
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/prp.png',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      uname!,
                      style: const TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontFamily: 'Avenir',
                      ),
                    ),
                    Text(
                      'Joined on: ${DateFormat('dd-MM-yyyy – kk:mm').format(utime.toDate())}',
                      style: const TextStyle(
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
                  child: Text(
                    "Points Earned:${upoints!}",
                    style: const TextStyle(fontSize: 16, fontFamily: 'Avenir'),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Email:",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontFamily: 'Nunito',
                  ),
                ),
                InkWell(
                  child: Text(
                    uemail!,
                    style: const TextStyle(
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
              children: [
                const Text(
                  "Phone No:",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontFamily: 'Nunito',
                  ),
                ),
                InkWell(
                  child: Text(
                    umob!,
                    style: const TextStyle(
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
              children: [
                const Text(
                  "City:",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontFamily: 'Nunito',
                  ),
                ),
                InkWell(
                  child: Text(
                    ucity!,
                    style: const TextStyle(
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

  String readTimestamp(int timestamp) {
    var now = DateTime.now();
    var format = DateFormat('HH:mm a');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var diff = now.difference(date);
    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = diff.inDays.toString() + ' DAY AGO';
      } else {
        time = diff.inDays.toString() + ' DAYS AGO';
      }
    } else {
      if (diff.inDays == 7) {
        time = (diff.inDays / 7).floor().toString() + ' WEEK AGO';
      } else {
        time = (diff.inDays / 7).floor().toString() + ' WEEKS AGO';
      }
    }

    return time;
  }
}
