import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toll_payetc/Model/drawer.dart';

class DashBoard extends StatelessWidget {
  late String response;

  DashBoard({required this.response});

  List apidata = [];

  Future getData(BuildContext context) async {
    var data = await http.post(
        Uri.parse("http://103.145.118.20/api/tollpay/registration_getapi.php"),
        body: {
          "Vehicle_number": response,
        });
    var dd = jsonDecode(data.body);
    print(dd);
    dd = apidata;
  }

  @override
  Widget build(BuildContext context) {
    getData(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0C8ECA),
      ),
      drawer: SlideDrawer(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("${response}"),
            Text(apidata.toString()),
          ],
        ),
      ),
    );
  }
}
