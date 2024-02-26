import 'package:bookly/core/Features/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> with SingleTickerProviderStateMixin{
 late AnimationController animationController;
 late Animation<Offset> slidingAnimation;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slidingAnimatio();
    navigationToHomeScreen();


  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlideTransition(
        position: slidingAnimation,
        child: (
        Center
          ( child :Image.asset('assets/images/Logo.png'),)
        ),
      ),
    );
  }
  void slidingAnimatio()
  {
    animationController=AnimationController(vsync: this,
        duration: Duration(seconds:2 ));
    slidingAnimation = Tween<Offset>(begin:const Offset(0,10), end:Offset.zero).animate(animationController);
    animationController.forward();
    slidingAnimation.addListener(() {
      setState(() {

      });

    });


  }
 void navigationToHomeScreen() {
   Future.delayed(Duration(seconds: 3),(){
     
     Get.offAll(HomeScreen(),transition: Transition.leftToRightWithFade,duration: Duration(seconds: 1));


   });
 }
}
