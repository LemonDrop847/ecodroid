import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/buttondecor.dart';
import 'HomePage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  bool? _success;
  String? _userEmail;
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 52, 71, 68),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color.fromARGB(49, 91, 91, 91),
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
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
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Name",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontFamily: 'Nunito',
                  ),
                ),
                TextFormField(
                  controller: _nameController,
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    labelText: "Enter Name",
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
                  "E-Mail ID",
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
                    labelText: "Enter E-Mail",
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
                  "Mobile Number",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontFamily: 'Nunito',
                  ),
                ),
                TextFormField(
                  controller: _mobController,
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    labelText: "Enter Mobile Number",
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
                  "City",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontFamily: 'Nunito',
                  ),
                ),
                TextFormField(
                  controller: _cityController,
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    labelText: "Enter City of Residence",
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
                  "Password",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontFamily: 'Nunito',
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Enter Password",
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
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Re-Enter Password",
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
                    title: 'Sign Up',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _register();
                      }
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
        ),
      ),
    );
  }

  void _register() async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email!;
        _firestore.collection('users').doc(user.uid).set({
          'id': user.uid,
          'email': _emailController.text,
          'name': _nameController.text,
          'mob': _mobController.text,
          'city': _cityController.text,
          'created': Timestamp.now(),
          'points': 0,
        }).then((_) {
          // ignore: avoid_print
          print('${_nameController.text} added succesfully');
        });
        _signInWithEmailAndPassword();
      });
    } else {
      setState(() {
        _success = true;
      });
    }
  }

  void _signInWithEmailAndPassword() async {
    final User? user = (await _auth.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;

    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email!;
        Navigator.pushNamed(context, HomePage.id);
      });
    } else {
      setState(() {
        _success = false;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
