import 'package:flutter/material.dart';
import '../components/buttondecor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'HomePage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginPage extends StatelessWidget {
  static const String id = 'login_page';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loginPage(),
    );
  }
}

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
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
                "Email Id",
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                  fontFamily: 'Nunito',
                ),
              ),
              TextFormField(
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                  hintText: "Enter email",
                  hintStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.w100,
                    fontFamily: 'ProductSans',
                  ),
                ),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                style: const TextStyle(
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
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _signInWithEmailAndPassword();
                    }
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
      ),
    );
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
}
