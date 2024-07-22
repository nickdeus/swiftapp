import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftapp/app/modules/clients/ClientsController.dart';

import '../../utils/colors.dart';


class ClientScreen extends StatelessWidget {
  final ClientsController _clientsController = Get.put(ClientsController());

  Widget build(BuildContext context) {
    _clientsController.getClients();
    return Scaffold(
      appBar: AppBar(
        title: Text('Clients'),
        centerTitle: true,
      ),
      body: Obx(() {
        // Check if the data is empty
        if (_clientsController.clientsData.value.isEmpty) {
          return Center(
            child: Text('No clients available'),
          );
        } else {
          // Render the ListView if data is not empty
          return ListView.builder(
            itemCount: _clientsController.clientsData.value['body'].length,
            itemBuilder: (context, index) {
              return Container(
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
                child: ListTile(
                  title: Text(_clientsController.clientsData.value['body'][index]['full_name']),
                  subtitle: Text(_clientsController.clientsData.value['body'][index]['phone']),
                  trailing: Text(_clientsController.clientsData.value['body'][index]['email']),
                  leading: CircleAvatar(child: Text(_clientsController.clientsData.value['body'][index]['full_name'][0]),),
                ),
              );
            },
          );
        }
      }),
    );
  }
}