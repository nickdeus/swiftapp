import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../utils/colors.dart';
import 'ShippingController.dart';


class ShippingScreen extends StatelessWidget {
  final ShippingController _shippingController =  Get.put(ShippingController());



  @override
  Widget build(BuildContext context) {

    return  SingleChildScrollView(
          child: Obx(() {
            if (_shippingController.isLoading.value) {
              return Container(
                margin: EdgeInsets.symmetric(vertical:MediaQuery.sizeOf(context).height/2.5),
                child: const Center(
                    child: CircularProgressIndicator()
                ),
              );
            } else {
              return  Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TabButtons(title: "FCL", isActive: false),
                      TabButtons(title: "LLC", isActive: false),
                      TabButtons(title: "All", isActive: true)
                    ],
                  ),
                  SizedBox(height: 20,),
                  TableContainer(tableTitle: "All Shipment", tableContent: DataTableExample(data:_shippingController.userShippingData.value["Loose Cargo Service (LCL)"])),
                ],
              );; // Return an empty container if not loading
            }
          }),
    );
  }
}



class TabButtons extends StatelessWidget {
  final String title;
  final bool isActive;
  const TabButtons({super.key, required this.title,required this.isActive});

  @override
  Widget build(BuildContext context) {
    Color buttonColor = (isActive)? AppColors.primaryPink : AppColors.primaryWhite;
    Color textColor = (!isActive)? AppColors.primaryPink : AppColors.primaryWhite;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: ElevatedButton(
          onPressed: () => { print('Sing up') },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: textColor),),
            ],
          ),

          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            minimumSize: const Size(110,30),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0), // Button border radius
              // Border color
            ),


          )
      ),
    );
  }
}


class TableContainer extends StatelessWidget {
  final String tableTitle;
  final Widget tableContent;
  const TableContainer({super.key, required this.tableTitle, required this.tableContent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Text(tableTitle ,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: AppColors.primaryDark),),
            ],
          ),
          SizedBox(height: 12,),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16,horizontal: 18),
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                color: AppColors.primaryWhite,
                boxShadow:[
                  BoxShadow(
                      color: Color(0x22000000),
                      offset: Offset.zero,
                      blurRadius: 6,
                      spreadRadius: 1,
                      blurStyle: BlurStyle.normal

                  )
                ]
            ),
            child: Column(
              children: [
                tableContent
              ],
            ),
          ),
        ],
      ),
    );

  }
}




class DataTableExample extends StatelessWidget {
  final List data;
  const DataTableExample({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      dataRowHeight: 38,
      dataTextStyle: GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: AppColors.primaryDark,
      ),
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'Cargo Name',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: AppColors.primaryDark,
              ),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'From',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: AppColors.primaryDark,
              ),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Status',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: AppColors.primaryDark,
              ),
            ),
          ),
        ),
      ],
      rows: data.map((row) {
        return   DataRow(
          cells:<DataCell>[
            DataCell(Text(row["shipping_cargo_name"])),
            DataCell(Text(row["origin_region"])),
            DataCell(Text(row["shipping_status"])),
          ],
        );
      }).toList(),
    );
  }
}
