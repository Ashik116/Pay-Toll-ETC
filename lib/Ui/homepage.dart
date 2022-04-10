import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:toll_payetc/Animation/loading.dart';
import 'package:toll_payetc/Model/drawer.dart';
import 'package:toll_payetc/Ui/sign_in.dart';
import 'package:toll_payetc/Units/About%20Us/about_us.dart';
import 'package:toll_payetc/Units/Feedback/feedback.dart';
import 'package:toll_payetc/Units/Tag%20Activition/tag_activition.dart';
import 'package:toll_payetc/Units/location.dart';
import 'package:toll_payetc/Units/recharge.dart';

import '../Constants/constants.dart';
import '../test.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSplashing = true;
  late bool isLoading;
  double customOpacity = 0;
  @override
  void initState() {
    isLoading = true;
    Future.delayed(const Duration(milliseconds: 5000), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return !isSplashing
        ? const loadingAnimation()
        : SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              drawer: const SlideDrawer(),
              backgroundColor: Colors.white,
              //floatingActionButton: Container(child: Text("Pay Your Toll in Smart Way"),),
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                title: const Text(
                  "Welcome to Toll Pay",
                  style: TextStyle(color: PrimaryColor),
                ),
                centerTitle: true,
                //leading: IconButton(icon: Icon(Icons.settings,color: Colors.white,),onPressed: (){SideDrawer();},),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                        semanticLabel:
                            'Text to announce in accessibility modes',
                      ))
                ],
                backgroundColor: Colors.transparent, elevation: 0,
              ),
              body: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.4,
                    width: size.width,
                    child: Image.asset(
                      "images/splashgif.gif",
                      fit: BoxFit.cover,
                      width: double.maxFinite,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  TweenAnimationBuilder(
                    onEnd: () {
                      setState(() {
                        customOpacity = 1;
                      });
                    },
                    curve: Curves.bounceOut,
                    duration: const Duration(milliseconds: 1000),
                    tween: Tween<double>(begin: 0, end: 1),
                    builder:
                        (BuildContext context, dynamic value, Widget? child) {
                      return AnimatedOpacity(
                        duration: const Duration(milliseconds: 800),
                        opacity: customOpacity,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 40,
                          child: Container(
                            child: Material(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                splashColor: Colors.purpleAccent,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const LoginScreen()));
                                },
                                child: const Center(
                                  child: Text(
                                    "SIGN IN NOW !",
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
                                    Color(0xFFFF4891),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Divider(
                          thickness: 1,
                          height: 2,
                          endIndent: 10,
                          color: Colors.blueAccent.shade200,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        SizedBox(
                          height: size.height * 0.26,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const Test()));
                                },
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: size.width * 0.01,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        const RechargePage()));
                                          },
                                          child: SizedBox(
                                            height: size.height * 0.11,
                                            width: size.width * 0.2,
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                    "images/icon/recharge.png"),
                                                SizedBox(
                                                  height: size.height * 0.01,
                                                ),
                                                const Text("Recharge"),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.15,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        const Test()));
                                          },
                                          child: SizedBox(
                                            height: size.height * 0.11,
                                            width: size.width * 0.2,
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                    "images/icon/violation.png"),
                                                SizedBox(
                                                  height: size.height * 0.01,
                                                ),
                                                const Text(
                                                    "Violations/\nDisputes"),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.15,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        const Tagactivition()));
                                          },
                                          child: SizedBox(
                                            height: size.height * 0.11,
                                            width: size.width * 0.2,
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                    "images/icon/tag.png"),
                                                SizedBox(
                                                  height: size.height * 0.01,
                                                ),
                                                const Text("Tag Activition"),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.17,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        const Tagactivition()));
                                          },
                                          child: SizedBox(
                                            height: size.height * 0.11,
                                            width: size.width * 0.2,
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                    "images/icon/cntc.png"),
                                                SizedBox(
                                                  height: size.height * 0.01,
                                                ),
                                                const Text("Contact Us"),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.08,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        const Test()));
                                          },
                                          child: SizedBox(
                                            height: size.height * 0.11,
                                            width: size.width * 0.3,
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                    "images/icon/help.png"),
                                                SizedBox(
                                                  height: size.height * 0.01,
                                                ),
                                                const Text("Help & Support"),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * 0.04,
                                    ),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        const FeedBack()));
                                          },
                                          child: SizedBox(
                                            height: size.height * 0.11,
                                            width: size.width * 0.2,
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                    "images/icon/feed.png"),
                                                SizedBox(
                                                  height: size.height * 0.01,
                                                ),
                                                const Text("Feedback"),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        const Test()));
                                          },
                                          child: SizedBox(
                                            height: size.height * 0.11,
                                            width: size.width * 0.25,
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                    "images/icon/happy.png"),
                                                SizedBox(
                                                  height: size.height * 0.01,
                                                ),
                                                const Text("Happiness Meter"),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.09,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) => MapView()));
                                          },
                                          child: SizedBox(
                                            height: size.height * 0.11,
                                            width: size.width * 0.2,
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                    "images/icon/location.png"),
                                                SizedBox(
                                                  height: size.height * 0.01,
                                                ),
                                                const Text("Location"),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.15,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        const AboutUs()));
                                          },
                                          child: SizedBox(
                                            height: size.height * 0.11,
                                            width: size.width * 0.2,
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                    "images/icon/aboutt.png"),
                                                SizedBox(
                                                  height: size.height * 0.01,
                                                ),
                                                const Text("About Us"),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.15,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        const Test()));
                                          },
                                          child: SizedBox(
                                            height: size.height * 0.11,
                                            width: size.width * 0.2,
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                    "images/icon/buy.png"),
                                                SizedBox(
                                                  height: size.height * 0.01,
                                                ),
                                                const Text("Buy a Tag"),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          height: 1,
                          endIndent: 10,
                          color: Colors.blueAccent.shade200,
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        SizedBox(
                          height: size.height * 0.11,
                          width: size.width,
                          child: CarouselSlider(
                            items: [
                              Center(
                                  child: Column(
                                children: const [
                                  Text(
                                    "\nYour gateway to Toll Pay\n just got simpler\n",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  //SizedBox(height: size.height*0.01,),
                                  Text("In line with ETC Toll Pay......")
                                ],
                              )),
                              //Container(child: Text("HELLO"),),
                            ],
                            options: CarouselOptions(
                              autoPlay: true,
                            ),
                          ),
                        ),
                        DotsIndicator(dotsCount: 2),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
