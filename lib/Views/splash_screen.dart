import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/Views/category_screen.dart';

import 'home_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('images/splash_pic.jpg',fit: BoxFit.cover , height: height*0.5),
          SizedBox(height: height * 0.04),
          Text("TOP HEADLINES",style: GoogleFonts.anton(fontSize: 30,letterSpacing: 0.6,color: Colors.grey.shade700) ),
          SizedBox(height: height * 0.02),
          SpinKitChasingDots(size: 40,color: Colors.blue,)
        ],
      ),
    );
  }
}
