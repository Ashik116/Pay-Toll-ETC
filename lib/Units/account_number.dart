import 'package:flutter/material.dart';
import 'package:toll_payetc/test.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Name",
            ),
          ),
          TextField(
            decoration: InputDecoration(labelText: "Account"),
          ),
          TextField(
            decoration: InputDecoration(labelText: "PIN"),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const Test()));
                  },
                  child: const Center(
                    child: Text(
                      "SUBMIT",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(colors: [
                    Color(0xFFFF4891),
                    Color(0xFF0C8ECA),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            ),
          ),
        ],
      ),
    );
  }
}
