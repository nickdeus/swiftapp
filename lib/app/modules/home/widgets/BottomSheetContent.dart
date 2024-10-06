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
      // if(_homeController.isLoading.value){
        if(_homeController.isLoading.value == true ){
        return
          Container(
            padding: EdgeInsets.all(14),
            height: _homeController.sheetHeight.value,
            width: MediaQuery.sizeOf(context).width,
            child: Center( child: CircularProgressIndicator()),
          );
      }else{
        if(_homeController.isSuccess.value){
          return  Column(
            children: [
              Container(child: Image.asset('assets/images/swift_cargo_logo.png',width: 68,height: 58,),
              padding: EdgeInsets.only(top: 5),
              ),


              Container(
                padding: EdgeInsets.all(14),
                height: _homeController.sheetHeight.value,
                width: MediaQuery.sizeOf(context).width,
                child: Table(
                  border: TableBorder.all(color: AppColors.primaryDark),
                  columnWidths: {
                    0: FixedColumnWidth(180), // Adjust to your needs
                    1: FlexColumnWidth(),
                  },
                  children: [
                    _buildTableRow('Tracking code:', _homeController.data["shipping_id"]),
                    _buildTableRow('Customer name:', _homeController.data["recipient_name"]),
                    _buildTableRow('Phone:', _homeController.data["recipient_phone"]),
                    _buildTableRow('Shipping cargo name:', _homeController.data["shipping_cargo_name"]),
                    _buildTableRow('No of packages:', _homeController.data["shipping_items"].length.toString()),
                    _buildTableRow('Cost:', _homeController.data["amount_paid"]),
                    _buildTableRow('Status:', _homeController.data["shipping_status"]),
                    _buildTableRow('Departure:', _homeController.data["date_loaded"]),
                    _buildTableRow('Destination:', _homeController.data["destination_region"]),
                  ],
                ),
              ),
            ],
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

  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: AppColors.primaryDark,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value ?? '-',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: AppColors.primaryDark,
            ),
          ),
        ),
      ],
    );
  }

}

//
// Container(
// padding: EdgeInsets.all(14),
// height: _homeController.sheetHeight.value,
// width: MediaQuery.sizeOf(context).width,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// Text("Shipping Cargo Name: ${_homeController.data["shipping_cargo_name"]}", style: GoogleFonts.poppins(
// fontWeight: FontWeight.w400,
// fontSize: 16,
// color: AppColors.primaryDark)),
// Text("Origin Region: ${_homeController.data["origin_region"]}",  style: GoogleFonts.poppins(
// fontWeight: FontWeight.w400,
// fontSize: 16,
// color: AppColors.primaryDark)),
// Text("Origin : ${_homeController.data["shipping_cargo_name"]}",  style: GoogleFonts.poppins(
// fontWeight: FontWeight.w400,
// fontSize: 16,
// color: AppColors.primaryDark)),
// Text("Loading Date: ${_homeController.data["date_loaded"]}",  style: GoogleFonts.poppins(
// fontWeight: FontWeight.w400,
// fontSize: 16,
// color: AppColors.primaryDark)),
// Text("Recepient Name: ${_homeController.data["recipient_name"]}",  style: GoogleFonts.poppins(
// fontWeight: FontWeight.w400,
// fontSize: 16,
// color: AppColors.primaryDark)),
// Text("Recipient Phone: ${_homeController.data["recipient_phone"]}",  style: GoogleFonts.poppins(
// fontWeight: FontWeight.w400,
// fontSize: 16,
// color: AppColors.primaryDark)),
// ],
// ),
//
// );