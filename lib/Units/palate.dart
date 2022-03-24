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
            height: size.height*0.1,
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: "Name"
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: "State"
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: "Category"
            ),
          ),
          Row(
            children: [
              Container(child:const TextField(),
              width: 100,
                color: Colors.red,

              ),
              Container(child:const TextField(),
                color: Colors.red,
                width: 10,
              ),
            ],
          ),


        ],
      ),
    );
  }
}
