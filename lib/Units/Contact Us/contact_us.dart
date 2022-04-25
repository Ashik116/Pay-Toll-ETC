import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../test.dart';

class Contactus extends StatefulWidget {
  const Contactus({Key? key}) : super(key: key);

  @override
  State<Contactus> createState() => _ContactusState();
}

class _ContactusState extends State<Contactus> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Color(0xFF0C8ECA),
            elevation: 0,
            centerTitle: true,
            title: const Text("Contact Us"),
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () async {
                      const url = 'https://regnum.com.bd/';

                      if (await canLaunch(url)) {
                        await launch(url);
                      }
                    },
                    child: SizedBox(
                        height: size.height * 0.05,
                        width: size.width * 0.1,
                        child: ClipOval(
                            child: Image.asset("images/icon/web.png"))),
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  GestureDetector(
                    onTap: () async {
                      const url =
                          'https://www.linkedin.com/in/regnum-resource-limited-3b1284170';

                      if (await canLaunch(url)) {
                        await launch(url);
                      }
                    },
                    child: SizedBox(
                        height: size.height * 0.05,
                        width: size.width * 0.1,
                        child: ClipOval(
                            child: Image.asset("images/icon/linkedin.png"))),
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  GestureDetector(
                    onTap: () async {
                      const url = 'https://regnum.com.bd/';

                      if (await canLaunch(url)) {
                        await launch(url);
                      }
                    },
                    child: SizedBox(
                        height: size.height * 0.05,
                        width: size.width * 0.1,
                        child: ClipOval(
                            child: Image.asset("images/icon/instagram.png"))),
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  GestureDetector(
                    onTap: () async {
                      const url =
                          'https://www.youtube.com/channel/UC7jJv9Ynvp3SkrpQWGymGYQ/featured';

                      if (await canLaunch(url)) {
                        await launch(url);
                      }
                    },
                    child: SizedBox(
                        height: size.height * 0.05,
                        width: size.width * 0.1,
                        child: ClipOval(
                            child: Image.asset("images/icon/youtube.png"))),
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  GestureDetector(
                    onTap: () async {
                      const url = 'https://www.facebook.com/regnumresource';

                      if (await canLaunch(url)) {
                        await launch(url);
                      }
                    },
                    child: SizedBox(
                        height: size.height * 0.05,
                        width: size.width * 0.1,
                        child: ClipOval(
                            child: Image.asset("images/icon/facebook.png"))),
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  GestureDetector(
                    onTap: () async {
                      const url = 'https://web.whatsapp.com/';

                      if (await canLaunch(url)) {
                        await launch(url);
                      }
                    },
                    child: SizedBox(
                        height: size.height * 0.05,
                        width: size.width * 0.1,
                        child: ClipOval(
                            child: Image.asset("images/icon/whatsapp.png"))),
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              const Text(
                "Get In Touch With Us",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Name"),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Mobile"),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              TextField(
                scrollPadding: const EdgeInsets.all(10),
                maxLines: 8,
                decoration: InputDecoration(
                  labelText: "Write Your Message",
                  suffixIcon: Icon(
                    Icons.task_alt_outlined,
                    color: Colors.lightGreen.shade500,
                  ),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
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
          )),
    );
  }
}
