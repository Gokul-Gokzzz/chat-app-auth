import 'package:chat_app/controller/auth_provider.dart';

import 'package:chat_app/view/home_screen.dart';

import 'package:chat_app/view/phone_login.dart';

import 'package:chat_app/view/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            height: 400,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 190),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Go ahead and set up your account',
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Sign in-up to enjoy',
                    style: GoogleFonts.roboto(
                        color: const Color.fromARGB(255, 165, 165, 165)),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                              hintText: '  Email', border: InputBorder.none)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                              hintText: '  Password',
                              border: InputBorder.none)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      signIn();
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>(
                          const Size.fromWidth(200)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFF688a74)),
                    ),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Consumer<AuthProviders>(
                    builder: (context, values, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey[200]),
                            child: IconButton(
                                onPressed: () {
                                  values.singupWithGoogle();
                                },
                                icon: const Icon(FontAwesomeIcons.google)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey[200]),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => PhoneLoginPage(),
                                  ));
                                },
                                icon: const Icon(FontAwesomeIcons.phone)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey[200]),
                            child: IconButton(
                                onPressed: () {
                                  values.signInWithGithub(context);
                                },
                                icon: const Icon(FontAwesomeIcons.github)),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have account?",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'signUp',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignUpPage(),
                      ));
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void signIn() async {
    final signInServices = Provider.of<AuthProviders>(context, listen: false);
    String email = emailController.text;
    String password = passwordController.text;
    User? user = await signInServices.signInWithEmail(email, password, context);
    if (user != null) {
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      print('there is some error ');
    }
  }
}
