import 'package:flutter/material.dart';
import 'package:recigraph/app_color.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.primaryColor,
        body: DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [AppColors.primaryColor, AppColors.whiteBackground],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: Stack(
              children: [
                const Positioned(
                  top: 85,
                    right: 0,
                    left: 0,
                    child: Center(child: Text('Welcome to ReciGraph',style: TextStyle(
                        fontSize: 28, fontWeight: FontWeight.w900),))),
                Positioned(
                  top: 95,
                  right: 0,
                  left: 0,
                  child: Transform(
                    transform: Matrix4.rotationZ(-0.1),
                    alignment: Alignment.center,
                    child: const SizedBox(
                        height: 600,
                        child: Image(
                          image: AssetImage('assets/starting.png'),
                        )),
                  ),
                ),
                Positioned(
                  bottom: -10,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 40),
                    child: SafeArea(
                      child: Column(
                        children: [
                          const Center(
                              child: Text(
                            'Generates Recipes From Food Images, Just For You!',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w900),
                            textAlign: TextAlign.center,
                          )),
                          const SizedBox(height: 25),
                          GestureDetector(
                              child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Text('Get Started',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  )),
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const HomeScreen()));
                              }),
                          const SizedBox(height: 30)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )));
  }
}
