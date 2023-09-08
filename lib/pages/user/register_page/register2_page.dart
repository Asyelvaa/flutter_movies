import 'package:flutter/material.dart';
import 'package:flutter_movies/constant/app_constant.dart';
import 'package:flutter_movies/pages/user/register_page/register_controller.dart';
import 'package:flutter_movies/pages/user/register_page/register_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Register2Page extends StatelessWidget {
  // const Register2Page({super.key});
  final RegistrationController profileController = Get.find<RegistrationController>();

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // HEADER
                 Text(
                  'Complete your profile!',  
                 style: GoogleFonts.bebasNeue()
                  .copyWith(fontSize: 30, color: Colors.black87)),
                  Container(
                    height: 400,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        // PROFILE IMAGE
                        WidgetProfileImage(),
                        // FULLNAME
                        WidgetInputText(
                          label: 'fullname', 
                          isObsecure: false, 
                          controller: profileController.fullnameController, 
                          icon: Icon(Icons.person)
                        ),
                        // PHONE NUMBER
                        WidgetInputText(
                          label: 'phone number', 
                          isObsecure: false, 
                          controller: profileController.phoneNumberController, 
                          icon: Icon(Icons.phone)
                        ),
                        // ADDRESS
                        WidgetInputText(
                          label: 'address', 
                          isObsecure: false, 
                          controller: profileController.addressController, 
                          icon: Icon(Icons.home)
                        ),
                      ],
                    ),
                  )
              ],
            ),
        
          ),
        ),
      ),
    );
  }
}
