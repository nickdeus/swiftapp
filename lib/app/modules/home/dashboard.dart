import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:swiftapp/app/modules/clients/clients_screen.dart';
import 'package:swiftapp/app/modules/home/home_controller.dart';
import 'package:swiftapp/app/modules/home/widgets/BottomSheetContent.dart';
import 'package:swiftapp/app/modules/home/widgets/StatCard.dart';
import 'package:swiftapp/app/modules/login/LoginController.dart';
import 'package:swiftapp/app/modules/reports/reports_screen.dart';
import 'package:swiftapp/app/modules/shipping/shipping_screen.dart';
import '../../utils/colors.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../shipping/ShippingController.dart';

class Dashboard extends StatefulWidget {
  final HomeController  _homeController =  Get.put(HomeController());
  final ShippingController  _shippingController =  Get.put(ShippingController());
  final LoginController  _loginController =  Get.put(LoginController());

  @override
  State<Dashboard> createState() => _DashboardState();

}

class _DashboardState extends State<Dashboard> {
  int currentPageIndex = 0;
  final HomeController _homeController = Get.find();
  final ShippingController _shippingController = Get.find();
  final LoginController  _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
_shippingController.userShippingData();
    final List<Widget> pages = [
      HomeScreen(),
      ShippingScreen(),
      ClientScreen(),
      ReportsScreen(),
    ];

    return Scaffold(
      bottomNavigationBar:  NavigationBar(
        shadowColor: AppColors.primaryPink,
        backgroundColor: AppColors.primaryWhite,
        elevation: 20,
        onDestinationSelected: (int index) {
           setState(() {
             currentPageIndex = index;
             print(currentPageIndex);
           });
        },
        indicatorColor: Colors.transparent,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Iconsax.home,color: AppColors.secondaryBlue),
            icon: Icon(Iconsax.home_copy),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Iconsax.truck_fast,color: AppColors.secondaryBlue),
            icon: Icon(Iconsax.truck_fast_copy),
            label: 'Shipping',
          ),
          NavigationDestination(
            selectedIcon: Icon(Iconsax.people, color: AppColors.secondaryBlue),
            icon: Icon(Iconsax.people_copy),
            label: 'Clients',
          ),
          // NavigationDestination(
          //     selectedIcon: Icon(Iconsax.note_1, color: AppColors.secondaryBlue),
          //     icon: Icon(Iconsax.note_1_copy),
          //     label: 'Report',
          // ),
        ],
      ),
      backgroundColor: AppColors.backgroundGray,
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>{
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
        backgroundColor: AppColors.secondaryBlue,
        shape: CircleBorder(),
        child: const Icon(Iconsax.box_search,color: AppColors.primaryWhite,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 10,
          centerTitle: true,
          backgroundColor: AppColors.primaryWhite,
          title: Text(
            "Swiftcargo",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.primaryPink,
            ),
          ),
          actions: [
            // Clickable settings icon with dropdown menu
            PopupMenuButton<int>(
              icon: Icon(
                Iconsax.setting_2_copy,
                size: 28,
                color: AppColors.secondaryBlue,
              ),
              onSelected: (value) {
                // Add your onClick logic here
                if (value == 1) {
                  print("Settings clicked");
                  // Navigate to settings page or show another dialog
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: TextButton(
                    onPressed: () {
                      // Add your logout functionality here
                      _loginController.logout();
                    },
                    child: Text(
                      "Logout",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryDark,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 10),
            Icon(
              Iconsax.notification_copy,
              size: 28,
              color: AppColors.primaryPink,
            ),
            SizedBox(width: 10),
          ],
        ),
      body:   pages[currentPageIndex]
    );
  }
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final HomeController _homeController =  Get.find();
    return  Obx((){
      if(_homeController.homeDataLoading.value){
          return Center(child:CircularProgressIndicator());
      }else{
        return
        Obx((){
          return
            SingleChildScrollView(
              child:  Column(
                children: [
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      StatCard(color:AppColors.primaryWhite,title: "Pending",value: _homeController.homeData['cargo_by_status']['Pending'].toString(),),
                      StatCard(color:AppColors.primaryWhite,title: "Loading",value: _homeController.homeData['cargo_by_status']['Loading'].toString(), )
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      StatCard(color:AppColors.secondaryBlue ,title: "In Transit",value: _homeController.homeData['cargo_by_status']['In-transit'].toString(),),
                      StatCard(color:AppColors.primaryPink ,title: "Arrived",value: _homeController.homeData['cargo_by_status']['Arrived'].toString(), )
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      StatCard(color:AppColors.primaryWhite,title: "Unloading",value: _homeController.homeData['cargo_by_status']['Unloading'].toString(),),
                      StatCard(color:AppColors.primaryWhite,title: "In Delivery",value: _homeController.homeData['cargo_by_status']['In delivery'].toString(), )
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      StatCard(color:AppColors.secondaryBlue ,title: "Delivered",value: _homeController.homeData['cargo_by_status']['Delivered'].toString(),),
                      StatCard(color:AppColors.primaryPink ,title: "Cancelled",value: _homeController.homeData['cargo_by_status']['Cancelled'].toString(), )
                    ],
                  ),

                  SizedBox(height: 10,),
                  // PinkButton(),
                  SizedBox(height: 30,),
                  AmountCard(),
                  SizedBox(height: 10,),
                  TableContainer(tableTitle: "Latest Shipment", tableContent: DataTableExample()),
                  SizedBox(height: 30,),

                ],
              ),
            ) ;
        });

      }
    });

  }
}








class DataTableExample extends StatelessWidget {
  final ShippingController _shippingController = Get.put(ShippingController());



  @override
  Widget build(BuildContext context) {
    List data = _shippingController.userShippingData
        .value["Loose Cargo Service (LCL)"];

    return

      DataTable(
        dataRowHeight: 38,
        dataTextStyle: GoogleFonts.poppins(

            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.primaryDark),
        columns: <DataColumn>[
          DataColumn(
            label: Expanded(
              child: Text(
                'Ship-Code',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.primaryDark),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Cost',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.primaryDark),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Status',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.primaryDark),
              ),
            ),
          ),
        ],
        rows: data.map((row) {
          return DataRow(
            cells: <DataCell>[
              DataCell(Text(row["shipping_cargo_name"])),
              DataCell(Text(row["origin_region"])),
              DataCell(Text(row["shipping_status"])),
            ],
          );
        }).toList(),
      );

  }
}
class PinkButton2 extends StatelessWidget {
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 6),
      child: ElevatedButton(
          onPressed: () => { _homeController.getTrackingData() },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.truck_copy,color: AppColors.primaryWhite,),
              SizedBox(width: 4),
              Text("Track Now", style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColors.primaryWhite),),
            ],
          ),

          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryPink,
            minimumSize: const Size(0,62),
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Button border radius
              // Border color
            ),


          )
      ),
    );
  }
}



class PinkButton extends StatelessWidget {
  const PinkButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child: ElevatedButton(
          onPressed: () => { print('Sing up') },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Iconsax.add_copy,color: AppColors.primaryWhite,),
                SizedBox(width: 4),
                Text("Register Shipping", style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: AppColors.primaryWhite),),
              ],
            ),

          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryPink,
            minimumSize: const Size(0,62),
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Button border radius
              // Border color
            ),


          )
      ),
    );
  }
}

class AmountCard extends StatelessWidget {
 final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16,horizontal: 18),
      width: MediaQuery.sizeOf(context).width*0.96,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Total Ammount Spend" ,style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: AppColors.primaryDark),),
         const  SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text( NumberFormat('#,###').format(_homeController.homeData['total_payment']['amount']),style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 30,
                  color: AppColors.primaryDark),),
              const Icon(Iconsax.arrow_swap_copy,size: 34,color: AppColors.secondaryBlue,)
            ],
          ),
         const SizedBox(height: 8,),
        ],
      ),
    );
  }
}







