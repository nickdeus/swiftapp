import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';


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
  const DataTableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      dataRowHeight: 38,
      dataTextStyle:  GoogleFonts.poppins(

          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: AppColors.primaryDark),
      columns:  <DataColumn>[
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
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('SH-227-TZA')),
            DataCell(Text('200,000/=')),
            DataCell(Text('Pending')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('AZ-354-TZA')),
            DataCell(Text('453,000/=')),
            DataCell(Text('Pending')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('MT-254-TZA')),
            DataCell(Text('1,000,000/=')),
            DataCell(Text('Pending')),
          ],
        ),
      ],
    );
  }
}