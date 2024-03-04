import 'package:chat_app/service/auth_service.dart';
import 'package:chat_app/view/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthenticationService authenticationService = AuthenticationService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
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
                  child: Text(
                    'Go ahead and set up your account',
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Sign in-up to enjoy',
                  style: GoogleFonts.roboto(
                      color: const Color.fromARGB(255, 165, 165, 165)),
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
                          controller: nameController,
                          decoration: const InputDecoration(
                              hintText: '  Name', border: InputBorder.none)),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
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
                  ElevatedButton(
                    onPressed: () {
                      signUp();
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void signUp() async {
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    User? user = await authenticationService.signUpWithEmailAndPassword(
        name, email, password);
    if (user != null) {
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      print('there is some error ');
    }
  }
}
