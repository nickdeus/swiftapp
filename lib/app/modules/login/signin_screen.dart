import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../routes/routes.dart';
import '../../utils/colors.dart';
import 'LoginController.dart';

class SigninScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.sizeOf(context).width * 0.4,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "Sign In",
                      style: GoogleFonts.poppins(
                        fontSize: 34,
                        color: AppColors.primaryPink,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: MediaQuery.sizeOf(context).width * 0.12,
                      ),
                      child: Text(
                        "Sign in to proceed",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                          color: AppColors.primaryDark,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                SignUpForm(),
                Column(
                  children: [
                    MainButton(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Back to",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            color: AppColors.primaryDark,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.register);
                          },
                          child: Text(
                            " Track now",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: AppColors.primaryBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Obx((){
                  if (loginController.isLoading.value) {
                    return const CircularProgressIndicator();
                  } else if(loginController.isError.value){
                    return Text("Wrong username or password",style: TextStyle(
                        color: AppColors.primaryPink
                    ),);
                  }else{
                         return Container();
                      }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainButton extends StatelessWidget {
  const MainButton({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find<LoginController>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child: ElevatedButton(
          onPressed: () => {
            // Get.toNamed(Routes.home)
              loginController.login()
             // print(loginController.password.value)
          },
          child: Center(
            child: Text("Sign In", style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: AppColors.primaryWhite),),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryBlue,
            minimumSize: Size(0, 62),
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Button border radius
              side: BorderSide(color: AppColors.secondaryBlue, width: 4), // Border color
            ),


          )
      ),
    );

  }
}

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find<LoginController>();
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              onChanged: (value) => loginController.email.value = value,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Email or Phone',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              onChanged: (value) => loginController.password.value = value,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Password',
              ),
            ),
          ),


        ],
      ),
    );
  }
}


