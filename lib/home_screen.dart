import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recigraph/app_color.dart';
import 'package:recigraph/new_screen.dart';

import 'about_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _showUpload(){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        shadowColor: AppColors.primaryColor,
        title: Row(
          children: [
            InkWell(onTap: (){Navigator.pop(context);}, child: Icon(Icons.close,size: 30,color: AppColors.primaryColor,)),
          ],
        ),
        content:
        Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.primaryColor,
              ),
              child: const Center(child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Select from device',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),),
              )),
            ),
              onTap: (){
                _imageFromGallery();Navigator.pop(context);
              },
            ),
            const SizedBox(height: 15),
            InkWell(child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.primaryColor,
              ),
              child: const Center(child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Take a photo',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),),
              )),
            ),
              onTap: (){
                _imageFromCamera();Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    });
  }
  Future _imageFromGallery() async{
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }
  Future _imageFromCamera() async{
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }
  File ? _selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Row(
          children: [
            InkWell(
              child: const Text(
                'ReciGraph',
                style:
                    TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ImageUploadWidget()));
              },
            ),
            const Spacer(),
            GestureDetector(
              child: const Text(
                'About',
                style:
                    TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AboutScreen()));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor,width: 4),
                borderRadius: BorderRadius.circular(18),
              ),
              child: _selectedImage !=null ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.file(_selectedImage!,),
              ):Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [ Icon(Icons.cloud_upload_outlined,size: 70,color: AppColors.primaryColor,),
                    const SizedBox(height: 10),
                    const Text('No file chosen, yet!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: AppColors.primaryColor,
                ),
                child: const Center(child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text('UPLOAD A FOOD IMAGE',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),),
                )),
              ),
              onTap: (){
                _showUpload();
              },
            ),
            
          ],
        ),
      ),
      ),
    );
  }
}
