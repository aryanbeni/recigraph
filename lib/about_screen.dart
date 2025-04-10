import 'package:flutter/material.dart';

import 'app_color.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget aboutView (String viewDescription){
      return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.primaryColor),
          child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text( viewDescription,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              )));
    }
    return Scaffold(
      body:
      Column(
        children: [Container(
          width: double.infinity,
          color: AppColors.primaryColor,
          child: Center(
              child: SafeArea(
                child: Text(
                  'ReciGraph\nRecipe Generation From Food Image',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              )),
        ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16),
            child: Column(
              children: [
                aboutView('Food photography is popular because people love and appreciate food. However, behind every dish lies a detailed recipe that remains unknown just by looking at its image. Our application bridges this gap by introducing an AI-powered recipe generation system that can recreate cooking recipes from food images.'),
                SizedBox(height: 10),
                aboutView('Using advanced deep learning techniques, our system:\n✅ Analyzes the food image to identify key ingredients.\n✅ Predicts ingredients in an unordered set to capture natural dependencies.\n✅ Step-by-step cooking instructions by leveraging the image and inferred ingredients.'),
                SizedBox(height: 10),
                aboutView('This application is designed to assist home cooks, food enthusiasts, and chefs in recreating dishes effortlessly by simply uploading an image.'),
                SizedBox(height: 10),
                aboutView('🚀 Made by Aryan, Akshat, and Nikunj'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
