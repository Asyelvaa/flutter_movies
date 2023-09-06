import 'package:flutter/material.dart';
import 'package:flutter_movies/constant/app_constant.dart';
import 'package:flutter_movies/pages/user/register_page/register_controller.dart';
import 'package:flutter_movies/pages/user/register_page/register_widget.dart';
import 'package:get/get.dart';

class Register2Page extends StatelessWidget {
  // const Register2Page({super.key});
  final RegistrationController profileController = Get.find<RegistrationController>();

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
    );
  }
}
