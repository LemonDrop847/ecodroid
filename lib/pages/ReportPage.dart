import 'package:cloud_firestore/cloud_firestore.dart';

import 'ProfilePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/buttondecor.dart';
import 'HomePage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class ReportPage extends StatelessWidget {
  static const String id = 'report_page';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: reportPage(),
    );
  }
}

class reportPage extends StatefulWidget {
  @override
  _reportPageState createState() => _reportPageState();
}

class _reportPageState extends State<reportPage> {
  final _firestore = FirebaseFirestore.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 52, 71, 68),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
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
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Email",
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                  fontFamily: 'Nunito',
                ),
              ),
              TextFormField(
                controller: _emailController,
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                  labelText: "Enter Email",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.w100,
                    fontFamily: 'ProductSans',
                  ),
                ),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'ProductSans',
                ),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Subject",
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                  fontFamily: 'Nunito',
                ),
              ),
              TextFormField(
                controller: _titleController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: "Enter A Problem",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w100,
                    color: Colors.grey,
                    fontFamily: 'ProductSans',
                  ),
                ),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'ProductSans',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Description",
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                  fontFamily: 'Nunito',
                ),
              ),
              TextFormField(
                controller: _descriptionController,
                minLines: 10,
                maxLines: 15,
                decoration: const InputDecoration(
                  labelText: "Describe the Problem Here",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w100,
                    color: Colors.grey,
                    fontFamily: 'ProductSans',
                  ),
                ),
                style: const TextStyle(
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
                  title: 'Send Report',
                  onPressed: () {
                    _firestore.collection('reports').add({
                      'email': _emailController.text,
                      'title': _titleController.text,
                      'description': _descriptionController.text
                    }).then((_) {
                      // ignore: avoid_print
                      print(
                          'added report from ${_emailController.text} successfully');
                    });
                    Navigator.pushNamed(context, HomePage.id);
                  },
                  colour: const Color.fromARGB(255, 84, 160, 56),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
