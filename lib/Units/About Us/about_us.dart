import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  List<String> items = [
    'About Us'
        'Privacy Policies'
        'Terms and Conditions'
        'Licenses'
        'Information Security'
  ];
  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;
  double getBiglDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [],
      ),
    );
  }

  // Widget buildList() => ListView.builder(
  //       itemCount: items.length,
  //       itemBuilder: (context, index) {
  //         final item = items[index];
  //
  //         return ListTile(
  //           subtitle: Text("Subtitel$index"),
  //           title: Text(item),
  //         );
  //       },
  //     );
}
