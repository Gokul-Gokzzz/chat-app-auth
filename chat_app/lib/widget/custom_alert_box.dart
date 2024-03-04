import 'package:chat_app/controller/basic_provider.dart';
import 'package:chat_app/service/auth_service.dart';
import 'package:chat_app/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class CustomAlertDialog extends StatelessWidget {
  final String veridicationId;
  CustomAlertDialog({
    required this.veridicationId,
    super.key,
  });
  final TextEditingController otpcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      backgroundColor: Colors.black,
      actions: [
        Pinput(
          length: 6,
          showCursor: true,
          defaultPinTheme: PinTheme(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.amber)),
          ),
          onChanged: (value) {
            Provider.of<BasicProvider>(context, listen: false).otpSetter(value);
          },
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            String userotp =
                Provider.of<BasicProvider>(context, listen: false).otpcode ??
                    "";
            verifyOtp(context, userotp);
          },
          child: Container(
            height: size.height * 0.07,
            width: size.width,
            decoration: BoxDecoration(
              color: const Color(0xFF688a74),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                'Submit',
                style: GoogleFonts.ubuntu(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void verifyOtp(context, String userotp) {
    AuthenticationService service = AuthenticationService();
    service.verifyOtp(
        verificationId: veridicationId,
        otp: userotp,
        onSuccess: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ));
        });
  }
}
