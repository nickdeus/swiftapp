import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';

class StatCard extends StatelessWidget {
  final Color color;
  final String title;
  final String value;
  const StatCard({super.key, required this.color, required this.title, required this.value});





  @override
  Widget build(BuildContext context) {
    final Color textColor = color != AppColors.primaryWhite ? AppColors.primaryWhite : AppColors.primaryDark;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 16,horizontal: 18),
      width: MediaQuery.sizeOf(context).width*0.48,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(10)),
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
          Text(title ,style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: textColor),),
          Text(value,style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 30,
              color: textColor),),
        ],
      ),
    );

  }
}
