import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toll_payetc/test.dart';


class GetImage extends StatefulWidget {
  const GetImage({Key? key}) : super(key: key);

  @override
  State<GetImage> createState() => _GetImageState();
}

class _GetImageState extends State<GetImage> {

  File? pickedImage;

  double getSmallDiameter(BuildContext context) =>
  MediaQuery.of(context).size.width * 2 / 3;
  double getBiglDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;


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
                  SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.5,
                    height: 40,
                    child: Container(
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          splashColor: Colors.amber,
                          onTap: (){
                            pickImage(ImageSource.camera);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.camera,color: Colors.white,),
                              Text("Camera",style: TextStyle(
                                color: Colors.white,
                              ),),

                            ],
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF176EB0),
                            Color(0xFFFF4891)
                          ],
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.03,),
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
                    width: MediaQuery.of(context).size.width*0.5,
                    height: 40,
                    child: Container(
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          splashColor: Colors.amber,
                          onTap: (){
                            pickImage(ImageSource.gallery);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.image,color: Colors.white,),
                              Text("Galary",style: TextStyle(
                                color: Colors.white,
                              ),),

                            ],
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF176EB0),
                              Color(0xFFFF4891)
                            ],
                          )
                      ),
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
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,elevation: 0,
      ),
      body: Stack(
        children: <Widget>[

          Positioned(
            left: -getSmallDiameter(context) / 3,
            bottom: -getSmallDiameter(context) / 3,
            child: Container(
              width: getSmallDiameter(context),
              height: getSmallDiameter(context),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Color(0xFF0C8ECA), Color(0xFFCFC3C3)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Positioned(
            right: -getSmallDiameter(context) / 3,
            top: -getSmallDiameter(context) / 3,
            child: Container(
              width: getSmallDiameter(context),
              height: getSmallDiameter(context),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Color(0xFF0C8ECA), Color(0xFFCFC3C3)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Positioned(
            right: -getBiglDiameter(context) / 5,
            bottom: -getBiglDiameter(context) / 2,
            child: Container(
              child: const Center(
                child: Text("",
                  style: TextStyle(
                      fontFamily: "Pacifico",
                      fontSize: 40,
                      color: Colors.white),
                ),
              ),
              width: getBiglDiameter(context),
              height: getBiglDiameter(context),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Color(0xFF176EB0), Color(0xFFEAE1E5)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Positioned(
            left: -getBiglDiameter(context) / 6,
            top: -getBiglDiameter(context) / 6,
            child: Container(
              child: const Center(
                child: Align(
                  alignment: Alignment.center,
                ),
              ),
              width: getBiglDiameter(context),
              height: getBiglDiameter(context),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Color(0xFF176EB0), Color(0xFFEAE1E5)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Positioned(
            right: -getBiglDiameter(context) / 1,
            bottom: -getBiglDiameter(context) / 2,
            child: Container(
              width: getBiglDiameter(context),
              height: getBiglDiameter(context),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xFFF3E9EE)),
            ),

          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ListView(
              children: <Widget>[
                const Center(
                    child: Text(
                  "Scan Your Blue Book",
                style: TextStyle(
                  fontFamily: "Pacifico",
                  color: Colors.white,
                  fontSize: 20,
                ),
                )),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      //border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.fromLTRB(10, 100, 10, 10),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
                  child: Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border:
                            Border.all(color: Colors.indigo, width: 5),
                          ),
                          child: GestureDetector(
                            onTap: imagePickerOption,
                            child: Container(
                              height: size.height*0.53,
                              width: size.width*1,
                              child: pickedImage != null
                                  ? Image.file(
                                pickedImage!,
                                width: size.width,
                                height: size.height*0.17,
                                fit: BoxFit.cover,
                              )
                                  : Image.asset("images/user.png",
                              height: size.height*0.17,
                                width: size.width*1,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 5,
                          child: IconButton(
                            onPressed: imagePickerOption,
                            icon: const Icon(
                              Icons.add_a_photo_outlined,
                              color: Colors.blue,
                              size: 30,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
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
                                Navigator.
                                push(context,
                                    MaterialPageRoute(builder: (_)=>const Test()));
                              },
                              child: const Center(
                                child: Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF176EB0),
                                    Color(0xFFFF4891)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

