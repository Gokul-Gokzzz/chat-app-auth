import 'package:chat_app/controller/firebase_provider.dart';
import 'package:chat_app/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.service,
    required this.size,
  });

  final AuthenticationService service;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Consumer<FirebaseProvider>(builder: (context, value, child) {
      if (value.messages.isEmpty) {
        return Center(child: Image.asset('assets/2606145_5625.jpg'));
      } else {
        return ListView.builder(
          controller: value.scrollController,
          itemCount: value.messages.length,
          itemBuilder: (context, index) {
            final chats = value.messages[index];
            DateTime dateTime = chats.time!.toDate();
            String formattedTime = DateFormat.jm().format(dateTime);

            var alignment =
                chats.senderId == service.firebaseAuth.currentUser!.uid
                    ? Alignment.centerRight
                    : Alignment.centerLeft;
            var bubblecolor =
                chats.senderId == service.firebaseAuth.currentUser!.uid
                    ? Colors.white
                    : const Color.fromARGB(255, 211, 228, 243);

            var borderradius =
                chats.senderId == service.firebaseAuth.currentUser!.uid
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(15))
                    : const BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15));

            if (chats.messagetype == "text") {
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                child: Align(
                  alignment: alignment,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: size.height * 0.05,
                      minWidth: size.width * 0.2,
                      maxWidth: size.width * 0.7,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: bubblecolor,
                        borderRadius: borderradius,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              chats.content!,
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    formattedTime,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.7)),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                child: Align(
                  alignment: alignment,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: size.height * 0.05,
                      minWidth: size.width * 0.2,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: bubblecolor,
                        borderRadius: borderradius,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.network(
                              chats.content!,
                              height: 300,
                            ),
                            SizedBox(
                              width: size.width * 0.2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    formattedTime,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.7)),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        );
      }
    });
  }
}
