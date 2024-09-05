import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swiftapp/app/modules/home/home_controller.dart';
import '../../routes/routes.dart';
import '../../utils/colors.dart';
import '../home/widgets/BottomSheetContent.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(height:MediaQuery.sizeOf(context).height ,child:
      Padding(
        padding:  EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).height*0.3),
        child: SingleChildScrollView(
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                      Text("Track Now ", style: GoogleFonts.poppins(
                          fontSize: 34,
                          color: AppColors.primaryPink
                      ),),
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 30,horizontal: MediaQuery.sizeOf(context).width*0.12),
                    child: Text("Track your freight to get the latest update", style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: AppColors.primaryDark),
                      textAlign: TextAlign.center,),
                  ),
                ],
              ),

              Column(

                children: [
                  MainButton(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Back to",style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          color: AppColors.primaryDark),),
                      TextButton(
                        onPressed: ()=>{Get.toNamed(Routes.login)},
                        child: Text("Sign In",style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: AppColors.primaryBlue),),
                      )
                    ],
                  )
                ],
              )
            ],
          )
          ,
        ),
      )
      ),
    );
  }
}

class MainButton extends StatelessWidget {
  const MainButton({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController  _homeController = Get.put(HomeController());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child: ElevatedButton(
          onPressed: () => {
            Get.bottomSheet(
              BottomSheetContent(),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
            ).whenComplete((){
              _homeController.closeBottomSheet();
            })
          },
          child: Center(
            child: Text("Track", style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: AppColors.primaryWhite),),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryPink,
            minimumSize: Size(0, 62),
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Button border radius
            ),
          )
      ),
    );

  }
}

