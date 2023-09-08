import 'package:flutter/material.dart';
import 'package:flutter_movies/constant/app_constant.dart';
import 'package:flutter_movies/pages/user/register_page/register_controller.dart';
import 'package:flutter_movies/pages/user/register_page/register_widget.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final RegistrationController profileController = Get.put(RegistrationController());
    RegisterContentList contentList = RegisterContentList();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: profileController.pageRegisterController,
                onPageChanged: (value) {
                  profileController.currentIndex.value = value;
                },
                itemCount: contentList.list_register.length,
                itemBuilder: (context, index) => contentList.list_register[index],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 30, left: 30, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => profileController.currentIndex.value == 0
                  ? Container()
                  : GestureDetector(
                    onTap: () {
                          profileController.pageRegisterController.previousPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        child:Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.arrow_back_ios_rounded),
                        ),
                      )
                    ),
                  Obx(() => profileController.currentIndex.value == contentList.list_register.length - 1
                  ? GestureDetector(
                    onTap: () {
                          Get.offAndToNamed('/homePage');
                        },
                        child:Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.arrow_forward_ios_rounded, color: AppColor.white,),
                        ),
                  )
                  : GestureDetector(
                    onTap: () {
                          profileController.pageRegisterController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        child:Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.arrow_forward_ios_rounded, color: AppColor.white,),
                        ),
                    )
                  )
                ]
              ),
            ),
          ],
        )
      ),
    );
  }
}