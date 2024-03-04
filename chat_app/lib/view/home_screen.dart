import 'package:chat_app/controller/firebase_provider.dart';

import 'package:chat_app/service/auth_service.dart';

import 'package:chat_app/view/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    Provider.of<FirebaseProvider>(context, listen: false).getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () async {
              await AuthenticationService().signout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<FirebaseProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: value.users.length,
                  itemBuilder: (context, index) {
                    final userdetails = value.users[index];

                    if (userdetails.uid !=
                        FirebaseAuth.instance.currentUser?.uid) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              splashColor:
                                  const Color.fromRGBO(41, 15, 102, .3),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ChatScreen(user: userdetails),
                                  )),
                              child: ListTile(
                                leading: const CircleAvatar(
                                  radius: 35,
                                  backgroundImage: AssetImage(
                                    'assets/profile.png',
                                  ),
                                ),
                                title: Text(
                                  userdetails.name ?? userdetails.email!,
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: const Text(
                                  " Tap to Chat",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: Divider(
                              height: 1,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          )
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
