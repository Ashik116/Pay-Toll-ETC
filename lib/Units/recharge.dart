import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Ui/sign_in.dart';

class RechargePage extends StatefulWidget {
  const RechargePage({Key? key}) : super(key: key);

  @override
  State<RechargePage> createState() => _RechargePageState();
}

class _RechargePageState extends State<RechargePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Color(0xFF0C8ECA),
        title: Text('Reacharge'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Card(
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(10),
          width: size.width,
          child: Column(
            children: [
              Text(
                "Choose your payment method",
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              const Text(
                "Recharge Number\n",
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
              const Text(
                "To recharge pleas Sign In your Pay Toll account.",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                height: size.height * 0.3,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 40,
                child: Container(
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      splashColor: Colors.purpleAccent,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginScreen()));
                      },
                      child: const Center(
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(colors: [
                      Color(0xFF176EB0),
                      Color(0xFFFF4891),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  ),
                ),
              ),
            ],
          ),
        ),
        color: Colors.blue,
      ),
    );
  }
}
