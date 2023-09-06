import 'package:flutter/material.dart';
import 'package:flutter_movies/pages/user/register_page/register_controller.dart';
import 'package:flutter_movies/pages/user/register_page/register_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Register1Page extends StatelessWidget {
  final RegistrationController controller = Get.find<RegistrationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // HEADER
               Image.asset(
                  'assets/images/moviellaLogo.png',
                  width: 150,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 400,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'SIGN UP',
                        style: GoogleFonts.bebasNeue()
                            .copyWith(fontSize: 30, color: Colors.black),
                      ),
                      // USERNAME
                      WidgetInputText(
                        label: 'username', 
                        isObsecure: false, 
                        controller: controller.usernameController, 
                        icon: Icon(Icons.person)),
                      // EMAIL
                      WidgetInputText(
                        label: 'email', 
                        isObsecure: false, 
                        controller: controller.emailController, 
                        icon: Icon(Icons.email)),
                      // PASSWORD
                      WidgetInputPassword()
                    ],
                  ),
                )              
            ]
          ),
        ),
      ),
      );
  }
}
