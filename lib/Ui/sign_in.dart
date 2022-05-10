import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:toll_payetc/Animation/loading.dart';
import 'package:toll_payetc/Ui/dashboard.dart';
import 'package:toll_payetc/Ui/sign_up.dart';
import 'package:toll_payetc/test.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;
  double getBiglDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;

  bool _obscureText = true;
  bool isLoading = true;
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future login() async {
    if (user.text.isNotEmpty && pass.text.isNotEmpty) {
      Fluttertoast.showToast(msg: "Done", gravity: ToastGravity.CENTER_RIGHT);
      var response = await http.post(
          Uri.parse("http://103.145.118.20/api/tollpay/login.php"),
          body: {"email": user.text, "Password": pass.text});

      var result = jsonDecode(response.body);

      Navigator.push(context,
          MaterialPageRoute(builder: (_) => DashBoard(response: result)));
      Fluttertoast.showToast(
        msg: "Successful",
        gravity: ToastGravity.CENTER_LEFT,
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 20,
      );
    } else {
      Fluttertoast.showToast(
        msg: "Something is wrong",
        gravity: ToastGravity.CENTER_LEFT,
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 20,
      );
    }
  }

  //RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? const loadingAnimation()
        : Scaffold(
            backgroundColor: const Color(0xFFEEEEEE),
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Stack(
              children: <Widget>[
                Positioned(
                  left: -getSmallDiameter(context) / 3,
                  bottom: -getSmallDiameter(context) / 3,
                  child: Container(
                    width: getSmallDiameter(context),
                    height: getSmallDiameter(context),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Color(0xFF0C8ECA), Color(0xFFCFC3C3)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  ),
                ),
                Positioned(
                  right: -getSmallDiameter(context) / 3,
                  top: -getSmallDiameter(context) / 3,
                  child: Container(
                    width: getSmallDiameter(context),
                    height: getSmallDiameter(context),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Color(0xFF0C8ECA), Color(0xFFCFC3C3)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  ),
                ),
                Positioned(
                  right: -getBiglDiameter(context) / 5,
                  bottom: -getBiglDiameter(context) / 2,
                  child: Container(
                    child: const Center(
                      child: Text(
                        "",
                        style: TextStyle(
                            fontFamily: "Pacifico",
                            fontSize: 40,
                            color: Colors.white),
                      ),
                    ),
                    width: getBiglDiameter(context),
                    height: getBiglDiameter(context),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Color(0xFF176EB0), Color(0xFFEAE1E5)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  ),
                ),
                Positioned(
                  left: -getBiglDiameter(context) / 5,
                  top: -getBiglDiameter(context) / 5,
                  child: Container(
                    child: const Center(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Toll Pay",
                          style: TextStyle(
                              fontFamily: "Pacifico",
                              fontSize: 40,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    width: getBiglDiameter(context),
                    height: getBiglDiameter(context),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Color(0xFF176EB0), Color(0xFFEAE1E5)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  ),
                ),
                Positioned(
                  right: -getBiglDiameter(context) / 1,
                  bottom: -getBiglDiameter(context) / 2,
                  child: Container(
                    width: getBiglDiameter(context),
                    height: getBiglDiameter(context),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xFFF3E9EE)),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            //border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        margin: const EdgeInsets.fromLTRB(20, 300, 20, 10),
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              controller: user,
                              decoration: InputDecoration(
                                  // prefix: const Icon(Icons.email),
                                  icon: const Icon(
                                    Icons.email,
                                    color: Color(0xFF176EB0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade100)),
                                  labelText: "Email",
                                  enabledBorder: InputBorder.none,
                                  labelStyle:
                                      const TextStyle(color: Colors.grey)),
                            ),
                            TextField(
                              controller: pass,
                              obscureText: _obscureText,
                              obscuringCharacter: "*",
                              decoration: InputDecoration(
                                  icon: IconButton(
                                    icon: const Icon(
                                      Icons.vpn_key,
                                      color: Color(0xFF176EB0),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade100)),
                                  labelText: "Password",
                                  enabledBorder: InputBorder.none,
                                  labelStyle:
                                      const TextStyle(color: Colors.grey)),
                            ),
                          ],
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const Test()));
                                },
                                child: const Text(
                                  "FORGOT PASSWORD?",
                                  style: TextStyle(
                                      color: Color(0xFF176EB0), fontSize: 11),
                                ),
                              ))),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
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
                                      login();
                                    },
                                    child: const Center(
                                      child: Text(
                                        "SIGN IN",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFF176EB0),
                                          Color(0xFFFF4891)
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "DON'T HAVE AN ACCOUNT ? ",
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const SignUpPage()));
                            },
                            child: const Text(
                              " SIGN UP",
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFFC10AE0),
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
