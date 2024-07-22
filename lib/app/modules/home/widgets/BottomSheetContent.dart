import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/colors.dart';
import '../dashboard.dart';
import '../home_controller.dart';


class  BottomSheetContent extends StatelessWidget {
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {

    return Obx((){
      if(_homeController.isLoading.value){
        return
          Container(
            padding: EdgeInsets.all(14),
            height: _homeController.sheetHeight.value,
            width: MediaQuery.sizeOf(context).width,
            child: Center( child: CircularProgressIndicator()),
          );
      }else{
        if(_homeController.isSuccess.value){
          return  Container(
            padding: EdgeInsets.all(14),
            height: _homeController.sheetHeight.value,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Shipping Cargo Name: ${_homeController.data["shipping_cargo_name"]}", style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: AppColors.primaryDark)),
                Text("Origin Region: ${_homeController.data["origin_region"]}",  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: AppColors.primaryDark)),
                Text("Origin : ${_homeController.data["shipping_cargo_name"]}",  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: AppColors.primaryDark)),
                Text("Loading Date: ${_homeController.data["date_loaded"]}",  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: AppColors.primaryDark)),
                Text("Recepient Name: ${_homeController.data["recipient_name"]}",  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: AppColors.primaryDark)),
                Text("Recipient Phone: ${_homeController.data["recipient_phone"]}",  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: AppColors.primaryDark)),
              ],
            ),

          );
        }else{
          return
            Container(
              padding: EdgeInsets.all(14),
              height: _homeController.sheetHeight.value,
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                children: [
                  Text("Cargo Tracking",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: AppColors.primaryDark),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      onChanged: (value)=>{ _homeController.trackingCode.value = value },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Tracking No',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    child: TextFormField(
                      onChanged: (value)=>{ _homeController.senderPhone.value = value },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Sender Phone',
                      ),
                    ),
                  ),
                  Text(_homeController.errorMessage.value),
                  PinkButton2()

                ],
              ),
            );
        }
      }

    });

  }
}