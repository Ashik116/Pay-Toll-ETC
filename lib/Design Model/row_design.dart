class Astatement {
  List<Data>? data;

  Astatement({this.data});

  Astatement.fromJson(Map<String, dynamic> json) {
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
  String? tid;
  String? vehicleNumber;
  String? amount;
  String? narration;
  String? type;
  String? tdate;

  Data(
      {this.tid,
      this.vehicleNumber,
      this.amount,
      this.narration,
      this.type,
      this.tdate});

  Data.fromJson(Map<String, dynamic> json) {
    tid = json['Tid'];
    vehicleNumber = json['Vehicle_number'];
    amount = json['Amount'];
    narration = json['Narration'];
    type = json['type'];
    tdate = json['Tdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Tid'] = this.tid;
    data['Vehicle_number'] = this.vehicleNumber;
    data['Amount'] = this.amount;
    data['Narration'] = this.narration;
    data['type'] = this.type;
    data['Tdate'] = this.tdate;
    return data;
  }
}
