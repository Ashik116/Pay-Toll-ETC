import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toll_payetc/Design%20Model/row_design.dart';
import 'package:toll_payetc/Model/drawer.dart';
import 'package:toll_payetc/Model/vehcle_response.dart';
import 'package:toll_payetc/Units/recharge_profile.dart';

class DashBoard extends StatefulWidget {
  String response;

  DashBoard({required this.response});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late String value;
  late String keyresponse = widget.response;

  Future<VechleResponse> getData() async {
    var user = await http.post(
        Uri.parse("http://103.145.118.20/api/tollpay/registration_getapi.php"),
        body: {
          "Vehicle_number": widget.response,
        });

    return VechleResponse.fromJson(jsonDecode(user.body));
  }

  Future<Astatement> getrowdata() async {
    var state = await http.post(
        Uri.parse(
            "http://103.145.118.20/api/tollpay/transantion_post_for_getdata.php"),
        body: {
          "Vehicle_number": widget.response,
        });
    return Astatement.fromJson(jsonDecode(state.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Icon(
              Icons.add,
              color: Colors.blueAccent,
            ),
            Text(
              "Recharge Now",
              style: TextStyle(
                color: Colors.blueAccent,
              ),
            )
          ],
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ProfileRecharge(vechielvalue: keyresponse)));
        },
      ),
      drawer: SlideDrawer(),
      appBar: AppBar(
        title: Text("Toll Pay"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 120,
            color: Colors.green,
            child: Expanded(
              child: Container(
                  height: 100,
                  color: Colors.green,
                  child: FutureBuilder(
                    future: getData(),
                    builder: (_, AsyncSnapshot response) {
                      if (response.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (response.hasData) {
                        VechleResponse vechleResponse =
                            response.data as VechleResponse;
                        return Scaffold(
                          body: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(7),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 20,
                                          child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "Name:- ${vechleResponse.data?[0].fName}",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Colors.black),
                                              )),
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Align(
                                                alignment: Alignment.topRight,
                                                child: Text(
                                                  "Balance:- ${vechleResponse.data?[0].balance},BDT",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                      color: Colors.black),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 20,
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Veh-No:- ${vechleResponse.data?[0].vehicleNumber}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.topCenter,
                                              child: Text(
                                                "Phone:- ${vechleResponse.data?[0].phone}",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                    gradient: const LinearGradient(
                                        colors: [Colors.white, Colors.white]),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 2.0,
                                          offset: Offset(2.0, 2.0))
                                    ]),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Text("No data Found");
                      }
                    },
                  )),
            ),
          ),
          Container(
            height: 30,
            color: Colors.blue.shade400,
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Previous Transaction",
                  style: TextStyle(fontSize: 25),
                )),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            child: Row(
              children: [
                Container(
                    width: 92,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Amount",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    )),
                Container(
                    width: 100,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Narration",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    )),
                Container(
                    width: 100,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Type",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    )),
                Container(
                    width: 90,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Date",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    )),
              ],
            ),
            height: 40.0,
            decoration: BoxDecoration(
                color: Colors.blue.shade400,
                border: Border.all(
                  color: Colors.blue.shade400,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                    colors: [Colors.blue.shade400, Colors.blue.shade400]),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0,
                      offset: Offset(2.0, 2.0))
                ]),
          ),
          Expanded(
            child: FutureBuilder<Astatement>(
                future: getrowdata(),
                builder: (_, AsyncSnapshot response) {
                  if (response.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (response.hasData) {
                    Astatement astatement = response.data as Astatement;
                    return Scaffold(
                      body: ListView.builder(
                        itemCount: response.data!.data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            shadowColor: Colors.black,
                            child: Container(
                              height: 40,
                              child: Row(
                                children: [
                                  Container(
                                    width: 80,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${astatement.data?[index].amount}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 90,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${astatement.data?[index].narration}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${astatement.data?[index].type}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${astatement.data?[index].tdate}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return Text("No Data found");
                }),
          ),
        ],
      ),
    );
  }
}
