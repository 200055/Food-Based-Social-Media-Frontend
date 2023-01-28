import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  String? token;

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat(reverse: true);
  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  @override
  void initState() {
    userToken();
    // TODO: implement initState
    super.initState();
    Timer(
        const Duration(seconds: 5),
        (() => token != null
            ? Navigator.pushNamed(context, '/navigation')
            : Navigator.pushNamed(context, '/welcome')));
  }

  userToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString("token");
      // username = prefs.getString("username");
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: FadeTransition(
        opacity: _animation,
        child: SizedBox(
          height: 50,
          width: 50,
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: SvgPicture.asset(
                'assets/images/newlogo.svg',
                semanticsLabel: 'Logo',
              )
              // child: Image.asset('assets/images/logo_dark.png')
              ),
        ),
      ),
    );
    // return Scaffold(
    //   body: SafeArea(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         AnimatedBuilder(
    //             child: SizedBox(
    //               height: 200,
    //               width: 200,
    //               child: Center(
    //                 child: Image.asset('assets/images/logo_dark.png'),
    //               ),
    //             ),
    //             animation: _controller,
    //             builder: (BuildContext context, Widget? child) {
    //               return Transform.rotate(
    //                   child: child, angle: _controller.value * 2.0 * math.pi);
    //             }),
    //         SizedBox(
    //           height: MediaQuery.of(context).size.height * .08,
    //         ),
    //         const Align(
    //           alignment: Alignment.center,
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
