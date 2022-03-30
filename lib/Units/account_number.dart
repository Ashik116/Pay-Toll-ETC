import 'package:flutter/material.dart';

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
          FlatButton(
            padding: EdgeInsets.all(10),
            onPressed: () {},
            child: const Text(
              "Add Recharge Profile",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            color: Colors.deepPurple,
            splashColor: Colors.amber,
            height: size.height * 0.05,
            minWidth: size.width * 0.8,
          ),
        ],
      ),
    );
  }
}
