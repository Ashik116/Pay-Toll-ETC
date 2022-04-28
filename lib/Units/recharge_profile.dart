import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:toll_payetc/Ui/dashboard2.dart';

class ProfileRecharge extends StatefulWidget {
  // const ProfileRecharge({Key? key}) : super(key: key);
  String vechielvalue;

  ProfileRecharge({required this.vechielvalue});

  @override
  State<ProfileRecharge> createState() => _ProfileRechargeState();
}

class _ProfileRechargeState extends State<ProfileRecharge> {
  TextEditingController amount = TextEditingController();
  late String printvalu = widget.vechielvalue;

  Future addblance() async {
    if (amount.text.isNotEmpty) {
      var recharge = await http.post(
          Uri.parse("http://103.145.118.20/api/tollpay/recharge.php"),
          body: {
            "Vehicle_number": printvalu,
            "Balance": amount.text,
          });

      Navigator.push(context, MaterialPageRoute(builder: (_) => GHOKKA()));
      Fluttertoast.showToast(
        msg: "Successful",
        gravity: ToastGravity.CENTER_LEFT,
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 20,
      );
    } else {
      Fluttertoast.showToast(
        msg: "Not Successful",
        gravity: ToastGravity.CENTER_LEFT,
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 20,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD MONEY"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${printvalu}"),
            Text(
              "Profile Recharge",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            TextField(
              controller: amount,
              decoration: InputDecoration(
                  icon: IconButton(
                    icon: const Icon(
                      Icons.monetization_on_rounded,
                      color: Color(0xFF176EB0),
                    ),
                    onPressed: () {},
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  labelText: "Amount",
                  enabledBorder: InputBorder.none,
                  labelStyle: const TextStyle(color: Colors.grey)),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 40,
              child: Container(
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    splashColor: Colors.amber,
                    onTap: () {
                      addblance();
                    },
                    child: const Center(
                      child: Text(
                        "CONFIRM",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                        colors: [
                          Color(0xFFFF4891),
                          Color(0xFF0C8ECA),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
