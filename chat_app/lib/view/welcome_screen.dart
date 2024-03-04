import 'package:chat_app/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              "assets/images/bgimg.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(1),
                ])),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 550, left: 20),
                child: Text(
                  "It's easy to chat to your friends with Rayan",
                  style:
                      GoogleFonts.comfortaa(fontSize: 35, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginPage()));
                },
                child: Container(
                  height: 50,
                  width: 280,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: Text("Get started",
                          style: GoogleFonts.comfortaa(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                          ))),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
