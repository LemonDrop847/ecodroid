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
  late bool _success;
  late String _userEmail;
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
              TextFormField(
                controller: _emailController,
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                  hintText: "Enter Username",
                  hintStyle: TextStyle(
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
              TextFormField(
                controller: _passwordController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Enter Password",
                  hintStyle: TextStyle(
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
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Re-Enter Password",
                  hintStyle: TextStyle(
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
      });
    } else {
      setState(() {
        _success = true;
      });
    }
  }
}
