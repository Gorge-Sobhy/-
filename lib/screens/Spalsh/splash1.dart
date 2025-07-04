import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_gorge_job/screens/Spalsh/widget/container.dart';
import 'package:my_gorge_job/screens/Spalsh/widget/text_spalsh_screen.dart';
import 'package:my_gorge_job/widgets/colors.dart';

class Splash1 extends StatefulWidget {
  const Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> with TickerProviderStateMixin {
  late AnimationController slideController,
      signincontroller,
      signoncontroller,
      showcontroller;
  late Animation<Offset> slideAnimation, signinanimation, signonanimation;
  late Animation<double> showAnimation;

  @override
  void initState() {
    super.initState();
    slideController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    // signincontroller = AnimationController(
    //   vsync: this,
    signincontroller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    signoncontroller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    showcontroller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 7),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: slideController, curve: Curves.easeInOut),
    );
    signinanimation = Tween<Offset>(
      begin: const Offset(5, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: signincontroller, curve: Curves.easeInOut),
    );
    signonanimation = Tween<Offset>(
      begin: const Offset(-5, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: signoncontroller, curve: Curves.easeInOut),
    );
    showAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: showcontroller, curve: Curves.easeInOut));
    Future.delayed(Duration(seconds: 1), () {
      showcontroller.forward().then((value) {
        slideController.forward().then((value) {
          signincontroller.forward();
          signoncontroller.forward();
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    slideController.dispose();
    signincontroller.dispose();
    signoncontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Gap(MediaQuery.of(context).size.height * 0.1),
          FadeTransition(
            opacity: showAnimation,
            child: SlideTransition(
              position: slideAnimation,
              child: Center(child: TextSpalshScreen(primaryColor: primaryColor)),
            ),
          ),
          Gap(MediaQuery.of(context).size.height * 0.65),
          SlideTransition(
            position: signinanimation,
            child: Containersplash(color: primaryColor, label: "تسجيل الدخول"),
          ),
          Gap(MediaQuery.of(context).size.height * 0.021),
          SlideTransition(
            position: signonanimation,
            child: Containersplash(color: Colors.white, label: " انشاء حساب "),
          ),
        ],
      ),
    );
  }
}
