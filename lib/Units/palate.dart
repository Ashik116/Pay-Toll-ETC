import 'package:flutter/material.dart';

import '../test.dart';

class Palate extends StatefulWidget {
  const Palate({Key? key}) : super(key: key);

  @override
  State<Palate> createState() => _PalateState();
}

class _PalateState extends State<Palate> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
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
            SizedBox(
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
          keyboardType: TextInputType.numberWithOptions(),
          decoration: InputDecoration(
            labelText: "Mobile Number",
          ),
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
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => const Test()));
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
    );
  }
}
