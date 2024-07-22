import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../routes/routes.dart';
import '../../utils/colors.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(child:
        Padding(
          padding:  EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).width*0.2,),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child:
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                    Column(
                      children: [
                        Image.asset('assets/images/swift_cargo_logo.png',width: 96,height: 86,),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Swift ", style: GoogleFonts.poppins(
                                fontSize: 34,
                                color: AppColors.primaryPink
                            ),),
                            Text("Cargo ", style: GoogleFonts.poppins(
                                fontSize: 34,
                                color: AppColors.primaryBlue),),
                          ],
                        ),
                      ],
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                    child: Text("Welcome and explore our app experience , shipping is made easier ", style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: AppColors.primaryDark),
                    textAlign: TextAlign.center,),
                  ),

                  Column(

                    children: [
                      MainButton(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(" OR",style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          color: AppColors.primaryDark),),
                          TextButton(
                            onPressed: (){
                                  Get.toNamed(Routes.register);
                                 },
                            child: Text(" Track you're Freight ",style: GoogleFonts.poppins(
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child: ElevatedButton(
          onPressed: () => {  Get.toNamed(Routes.login) },
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

