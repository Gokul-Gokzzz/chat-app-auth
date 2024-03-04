import 'dart:io';
import 'package:chat_app/controller/basic_provider.dart';
import 'package:chat_app/service/chat_service.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ImageSelectorDialog extends StatelessWidget {
  const ImageSelectorDialog(
      {super.key,
      required this.pro,
      required this.size,
      required this.recieverId});
  final BasicProvider pro;
  final Size size;
  final String recieverId;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromRGBO(64, 42, 124, 1),
      content: Text(
        'Select image',
        style: GoogleFonts.poppins(fontSize: 20),
      ),
      actions: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    pro.imageSelector(source: ImageSource.camera);
                  },
                  child: Container(
                    width: size.width * 0.2,
                    height: size.height * 0.05,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(164, 148, 231, 1)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      FontAwesomeIcons.camera,
                      color: Color.fromRGBO(164, 148, 231, 1),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    pro.imageSelector(source: ImageSource.gallery);
                  },
                  child: Container(
                    width: size.width * 0.2,
                    height: size.height * 0.05,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(164, 148, 231, 1)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      FontAwesomeIcons.photoFilm,
                      color: Color.fromRGBO(164, 148, 231, 1),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: size.height * 0.2,
                width: size.width * 0.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: pro.selectedImage != null
                            ? FileImage(pro.selectedImage!)
                            : const AssetImage('assets/profile.png')
                                as ImageProvider)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () {
                  sendImage(recieverId, context);
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: size.height * 0.06,
                  width: size.width * 0.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 153, 166, 225)),
                  child: Center(
                      child: Text(
                    "Send",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  sendImage(recieverid, context) async {
    final pro = Provider.of<BasicProvider>(context, listen: false);
    if (pro.selectedImage != null) {
      ChatService().addImageMessage(recieverid, File(pro.selectedImage!.path));
    }
  }
}
