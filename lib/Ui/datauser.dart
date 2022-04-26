// To parse this JSON data, do
//
//     final usermodel = usermodelFromMap(jsonString);

import 'dart:convert';

Usermodel usermodelFromMap(String str) => Usermodel.fromMap(json.decode(str));

String usermodelToMap(Usermodel data) => json.encode(data.toMap());

class Usermodel {
  Usermodel({
    this.data,
  });

  List<Datum> data;

  factory Usermodel.fromMap(Map<String, dynamic> json) => Usermodel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Datum {
  Datum({
    this.email,
    this.vehicleNumber,
    this.fName,
    this.phone,
    this.address,
    this.balance,
    this.blueBook,
  });

  String email;
  String vehicleNumber;
  String fName;
  String phone;
  String address;
  dynamic balance;
  dynamic blueBook;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        email: json["email"],
        vehicleNumber: json["Vehicle_number"],
        fName: json["FName"],
        phone: json["Phone"],
        address: json["Address"],
        balance: json["Balance"],
        blueBook: json["blue_book"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "Vehicle_number": vehicleNumber,
        "FName": fName,
        "Phone": phone,
        "Address": address,
        "Balance": balance,
        "blue_book": blueBook,
      };
}
