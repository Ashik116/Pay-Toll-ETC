import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toll_payetc/test.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
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
                            pickImage(ImageSource.camera);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.camera,
                                color: Colors.white,
                              ),
                              Text(
                                "Camera",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                            colors: [Color(0xFF176EB0), Color(0xFFFF4891)],
                          )),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  // ElevatedButton.icon(
                  //   onPressed: () {
                  //     pickImage(ImageSource.camera);
                  //   },
                  //   icon: const Icon(Icons.camera),
                  //   label: const Text("CAMERA"),
                  // ),
                  // ElevatedButton.icon(
                  //   onPressed: () {
                  //     pickImage(ImageSource.gallery);
                  //   },
                  //   icon: const Icon(Icons.image),
                  //   label: const Text("GALLERY"),
                  // ),
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
                            pickImage(ImageSource.gallery);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.image,
                                color: Colors.white,
                              ),
                              Text(
                                "Gallery",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                            colors: [Color(0xFF176EB0), Color(0xFFFF4891)],
                          )),
                    ),
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Feedback"),
          backgroundColor: Color(0xFF0C8ECA),
          actions: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: GestureDetector(
                onTap: () {},
                child: const Text("Reset"),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            const TextField(
              decoration: InputDecoration(labelText: "Select Enquiry"),
            ),
            const TextField(
              decoration: InputDecoration(labelText: "Name"),
            ),
            const TextField(
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "Mobile"),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "Account Number"),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            TextField(
              scrollPadding: const EdgeInsets.all(10),
              maxLines: 8,
              decoration: InputDecoration(
                labelText: "Write Your Feedback",
                suffixIcon: Icon(
                  Icons.task_alt_outlined,
                  color: Colors.lightGreen.shade500,
                ),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: imagePickerOption,
                  child: SizedBox(
                    height: size.height * 0.1,
                    width: size.width * 0.3,
                    child: pickedImage != null
                        ? Image.file(
                            pickedImage!,
                            height: size.height * 0.1,
                            width: size.width * 0.1,
                          )
                        : Image.asset("images/icon/add_image.png"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.05,
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
                    gradient: const LinearGradient(
                        colors: [
                          Color(0xFFFF4891),
                          Color(0xFF0C8ECA),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
