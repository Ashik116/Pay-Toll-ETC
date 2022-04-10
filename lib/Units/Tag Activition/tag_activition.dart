import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class Tagactivition extends StatefulWidget {
  const Tagactivition({Key? key}) : super(key: key);

  @override
  State<Tagactivition> createState() => _TagactivitionState();
}

class _TagactivitionState extends State<Tagactivition> {
  String _vehicleType = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: const Text("Tag Activation"),
          ),
          body: Column(
            children: [
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                height: size.height * 0.1,
                width: size.width,
                color: Colors.black12,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Basic Information",
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.101,
              ),
              const TextField(
                decoration: InputDecoration(labelText: "TC Number"),
              ),
              const TextField(
                decoration: InputDecoration(labelText: "Tag Number"),
              ),
              const TextField(
                decoration: InputDecoration(labelText: "Mobile Number"),
              ),
              const TextField(
                decoration: InputDecoration(labelText: "Location"),
              ),
              DropdownSearch<String>(
                mode: Mode.MENU,
                items: const [
                  'Private-Car',
                  'Truck',
                  'Bus',
                  'CNG',
                  'MotorCycle',
                  'Micro Bus',
                  'None',
                ],
                dropdownSearchDecoration: const InputDecoration(
                  labelText: "Category",
                  hintText: "Select Your Vehicle",
                ),
                onChanged: (value) {
                  _vehicleType = value.toString();
                },
                // selectedItem: "Tender"
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: "Plate Number",
                  hintText: "DHA-G-11-XXXXX",
                ),
              ),
              SizedBox(
                height: size.height * 0.15,
              ),
              FlatButton(
                padding: const EdgeInsets.all(10),
                onPressed: () {},
                child: const Text(
                  "CONFIRM",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                color: Colors.deepPurple,
                splashColor: Colors.amber,
                height: size.height * 0.05,
                minWidth: size.width * 0.8,
              ),
            ],
          )),
    );
  }
}
