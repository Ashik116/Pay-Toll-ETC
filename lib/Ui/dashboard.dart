import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toll_payetc/Model/drawer.dart';
import 'package:toll_payetc/Model/vehcle_response.dart';

class DashBoard extends StatelessWidget {
  String response;

  DashBoard({required this.response});

  List apidata = [];

  Future<VechleResponse> getData(BuildContext context) async {
    var data = await http.post(
        Uri.parse("http://103.145.118.20/api/tollpay/registration_getapi.php"),
        body: {
          "Vehicle_number": response,
        });

    return VechleResponse.fromJson(jsonDecode(data.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0C8ECA),
        ),
        drawer: SlideDrawer(),
        body: FutureBuilder(
          future: getData(context),
          builder: (_, AsyncSnapshot response) {
            if (response.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (response.hasData) {
              VechleResponse vechleResponse = response.data as VechleResponse;
              return Container(
                height: 400,
                width: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Full NAme:-${vechleResponse.data?[0].fName}"),
                    Text("E-mail:-${vechleResponse.data?[0].email}"),
                    Text(
                        "Vehicle_Number:-${vechleResponse.data?[0].vehicleNumber}"),
                    Text("Phone:-${vechleResponse.data?[0].phone}"),
                    Text("Balance:-${vechleResponse.data?[0].balance}"),
                    Text("Blue-Book:-${vechleResponse.data?[0].blueBook}"),
                    Text("Address:-${vechleResponse.data?[0].address}"),
                  ],
                ),
              );
            } else {
              return Text("No data Found");
            }
          },
        ));
  }
}
