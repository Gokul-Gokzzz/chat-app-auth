import 'package:chat_app/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneLoginPage extends StatelessWidget {
  PhoneLoginPage({super.key});

  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController otpcontroller = TextEditingController();
  final AuthenticationService service = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  "OTP Verification",
                  style: GoogleFonts.ubuntu(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'We will send you a ',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "One Time Password",
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const Text(
                "on your mobile number",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 50),
              Column(
                children: [
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[200],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: phonecontroller,
                        decoration: const InputDecoration(
                          hintText: '  phone',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 20),
                    child: Container(
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: namecontroller,
                          decoration: const InputDecoration(
                            hintText: '  Name',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 20),
                    child: Container(
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: emailcontroller,
                          decoration: const InputDecoration(
                            hintText: '  Email',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: InkWell(
                      splashColor: Colors.black,
                      borderRadius: BorderRadius.circular(25),
                      onTap: () {
                        String countrycode = "+91";
                        String phonenumber = countrycode + phonecontroller.text;
                        service.signInWithPhone(
                          phonenumber,
                          context,
                          namecontroller.text,
                          emailcontroller.text,
                        );
                      },
                      child: Container(
                        width: size.width,
                        height: size.height * 0.08,
                        decoration: BoxDecoration(
                          color: const Color(0xFF688a74),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            'Generate Otp',
                            style: GoogleFonts.ubuntu(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
