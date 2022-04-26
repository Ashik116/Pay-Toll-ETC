class VechleResponse {
  List<Data>? data;

  VechleResponse({this.data});

  VechleResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? email;
  String? vehicleNumber;
  String? fName;
  String? phone;
  String? address;
  dynamic balance;
  dynamic blueBook;

  Data(
      {this.email,
      this.vehicleNumber,
      this.fName,
      this.phone,
      this.address,
      this.balance,
      this.blueBook});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    vehicleNumber = json['Vehicle_number'];
    fName = json['FName'];
    phone = json['Phone'];
    address = json['Address'];
    balance = json['Balance'];
    blueBook = json['blue_book'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['Vehicle_number'] = this.vehicleNumber;
    data['FName'] = this.fName;
    data['Phone'] = this.phone;
    data['Address'] = this.address;
    data['Balance'] = this.balance;
    data['blue_book'] = this.blueBook;
    return data;
  }
}
