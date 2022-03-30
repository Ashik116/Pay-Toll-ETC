import 'package:flutter/material.dart';

class Palate extends StatefulWidget {
  const Palate({Key? key}) : super(key: key);

  @override
  State<Palate> createState() => _PalateState();
}

class _PalateState extends State<Palate> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          const TextField(
            decoration: InputDecoration(labelText: "Name"),
          ),
          const TextField(
            decoration: InputDecoration(labelText: "State"),
          ),
          const TextField(
            decoration: InputDecoration(labelText: "Category"),
          ),
          Row(
            children: [
              Container(
                child: const TextField(
                  decoration: InputDecoration(
                    labelText: "Plate Code",
                  ),
                ),
                width: size.width * 0.3,
              ),
              const SizedBox(
                width: 10,
              ),
              const Expanded(
                  child: TextField(
                decoration: InputDecoration(labelText: "Plate Number"),
              )),
            ],
          ),
          const TextField(
            decoration: InputDecoration(labelText: "Mobile Number"),
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
