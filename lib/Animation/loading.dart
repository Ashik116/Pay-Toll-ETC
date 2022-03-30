import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loadingAnimation extends StatefulWidget {
  const loadingAnimation({
    Key? key,
  }) : super(key: key);

  @override
  State<loadingAnimation> createState() => _loadingAnimationState();
}

class _loadingAnimationState extends State<loadingAnimation> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey[800],
          body: const Center(
            child: SpinKitCircle(
              duration: Duration(milliseconds: 1050),
              color: Colors.white,
            ),
          )),
    );
    // Material(
    //   color: Colors.white,
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       SpinKitSpinningLines(
    //         color: Colors.blueAccent.shade400,
    //         size: 130,
    //       ),
    //       SizedBox(height: 10,),
    //       DefaultTextStyle(
    //         style: TextStyle(
    //           color: Colors.lightGreen,
    //           fontSize: 17,
    //           fontWeight: FontWeight.bold,
    //         ),
    //         child: AnimatedTextKit(
    //           animatedTexts:
    //           [
    //             TypewriterAnimatedText('Loading...', speed: Duration(milliseconds: 150))
    //           ],
    //           isRepeatingAnimation: true,
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
