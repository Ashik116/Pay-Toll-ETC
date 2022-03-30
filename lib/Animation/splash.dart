import 'package:animate_do/animate_do.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:toll_payetc/Ui/homepage.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var isSplashing = true;
  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;
  double getBiglDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  void getconnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      try {
        Future.delayed(const Duration(seconds: 2)).then((value) async {
          Future.delayed(const Duration(seconds: 2)).whenComplete(() {
            if (isSplashing) {
              snackbarMsg("Your Internet Connections Restart Successfully");
            }
          });
          isSplashing = false;
          refresh();
        });
      } catch (e) {}
    } else {
      getconnection();
      //snackbarMsg("Please check internet connection");

    }
  }

  @override
  void initState() {
    super.initState();
    getconnection();
  }

  @override
  Widget build(BuildContext context) {
    return !isSplashing
        ? const HomePage()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            key: _scaffoldKey,
            body: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/splsh.jpg"), fit: BoxFit.fill)),
              child: Stack(
                children: [
                  // Align(
                  //     alignment: Alignment.bottomCenter,
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(top: 10),
                  //       child:
                  //           Text("Roads And Highway Division\nGovernment of the People's Republic of Bangladesh",style: TextStyle(color: Colors.white),),
                  //     )),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 170),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FadeInLeft(
                            duration: const Duration(milliseconds: 800),
                            child: Image.asset(
                              "images/logo.png",
                              height: 150,
                              width: 150,
                            ),
                          ),
                          //FadeInRight(
                          //  duration: Duration(milliseconds: 800),
                          //  child: Text(
                          //   "Smart Toll",
                          // style: TextStyle(
                          //   color: Colors.redAccent.shade200,
                          //   fontSize: 20,
                          //    fontWeight: FontWeight.bold,
                          ///     letterSpacing: 1),
                          //  ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: BounceInDown(
                          duration: const Duration(milliseconds: 800),
                          child: const Text("PAY-TOLL")),
                    ),
                  )
                ],
              ),
            ),
          );
  }

  void snackbarMsg(loginErrorMessage) {
    final msg = SnackBar(
      duration: const Duration(seconds: 10),
      content: Text(
        loginErrorMessage.toString(),
        style: const TextStyle(color: Colors.red),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(msg);
  }
}

// Route HomePage()
