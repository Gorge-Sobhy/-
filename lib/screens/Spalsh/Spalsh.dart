import 'package:flutter/material.dart';
import 'package:my_gorge_job/screens/Spalsh/widget/text_spalsh_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late AnimationController slideController;
  late Animation<Offset> slideAnimation;
  late AnimationController colorController;
  late Animation<Color?> colorAnimation;

  @override
  void initState() {
    super.initState();
    slideController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    slideAnimation = Tween<Offset>(
      begin: const Offset(0, -15),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: slideController, curve: Curves.easeInOut),
    );

    colorController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    colorAnimation = ColorTween(
      begin: const Color(0xFF8B7045),
      end: Colors.white,
    ).animate(
      CurvedAnimation(parent: colorController, curve: Curves.easeInOut),
    );

    slideController.forward().then((value) {
      colorController.forward().then((value) {
        // Navigate to the next screen after the animation completes
        Navigator.pushReplacementNamed(context, '/Splash1');
      });
    });
  }

  @override
  void dispose() {
    slideController.dispose();
    colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: colorAnimation,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: colorAnimation.value,
          body: Center(
            child: SlideTransition(
              position: slideAnimation,
              child: TextSpalshScreen(primaryColor: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
