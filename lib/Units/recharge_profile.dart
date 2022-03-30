import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toll_payetc/Units/account_number.dart';
import 'package:toll_payetc/Units/palate.dart';

class ProfileRecharge extends StatefulWidget {
  const ProfileRecharge({Key? key}) : super(key: key);

  @override
  State<ProfileRecharge> createState() => _ProfileRechargeState();
}

class _ProfileRechargeState extends State<ProfileRecharge> {
  File? pickedImage;

  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Pic Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  void reset() {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              flexibleSpace: Center(
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: imagePickerOption,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.indigo, width: 5),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        child: ClipOval(
                          child: pickedImage != null
                              ? Image.file(
                                  pickedImage!,
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  "images/user.png",
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 4,
                      right: 0,
                      child: IconButton(
                        onPressed: imagePickerOption,
                        icon: const Icon(
                          Icons.add_a_photo_outlined,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              title: const Text("Add Recharge Profile"),
              actions: const [
                Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text("Reset"),
                )
              ],
              backgroundColor: Colors.deepPurple,
              collapsedHeight: 200,
              bottom: const TabBar(
                indicatorColor: Colors.amber,
                // labelColor: Colors.amber,
                indicatorWeight: 2,
                tabs: [
                  Text("PALATE/MOBILE"),
                  Text("ACCOUNT/PIN"),
                ],
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: [
                  Palate(),
                  Account(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
