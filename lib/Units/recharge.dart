import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:toll_payetc/Units/recharge_profile.dart';

class RechargePage extends StatefulWidget {
  const RechargePage({Key? key}) : super(key: key);

  @override
  State<RechargePage> createState() => _RechargePageState();
}

class _RechargePageState extends State<RechargePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.deepPurple,
        title: const Text('Reacharge'),
        actions: [
          IconButton(onPressed: (){}, icon:const Icon(Icons.search), ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_)=>const ProfileRecharge()));
        },
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),


      ),
    );
  }
}
