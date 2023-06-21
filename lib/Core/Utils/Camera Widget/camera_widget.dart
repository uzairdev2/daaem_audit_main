// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constant/Colors/colors.dart';

class CameraWidget extends StatelessWidget {
  final double containerWidth;
  final double containerHeight;
  final Color containerColor;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final RxBool? showImage;
  final Rx<File?>? imagePath;
  final String cameraIconPath;
  final String buttonText;
  final Color buttonTextColor;
  final double buttonTextSize;
  final TextAlign buttonTextAlignment;
  final FontWeight buttonTextWeight;
  final VoidCallback? onTap;

  const CameraWidget({
    Key? key,
    this.containerWidth = 47,
    this.containerHeight = 47,
    this.containerColor = Colors.transparent,
    this.borderColor = red,
    this.borderWidth = 1,
    this.borderRadius = 10,
    this.showImage,
    this.imagePath,
    this.cameraIconPath = 'assets/images/camera.png',
    this.buttonText = 'Take a Picture',
    this.buttonTextColor = Colors.black,
    this.buttonTextSize = 12,
    this.buttonTextAlignment = TextAlign.center,
    this.buttonTextWeight = FontWeight.w700,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: containerWidth,
          height: containerHeight,
          decoration: BoxDecoration(
            color: containerColor,
            border: Border.all(
              color: borderColor,
              width: borderWidth,
            ),
           // borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Obx(() {
            final File ? gandulaImagePath = imagePath?.value;
            if (gandulaImagePath != null) {
              return Image.file(
                gandulaImagePath,
                fit: BoxFit.cover,
              );
            } else {
              return Center(
                child: Image.asset(
                  cameraIconPath,
                  width: 22,
                  height: 20,
                  fit: BoxFit.cover,
                ),
              );
            }
          }),
        ),
        SizedBox(width: 10),
        InkWell(
          onTap: onTap,
          child: Text(
            buttonText,
            style: TextStyle(
              color: buttonTextColor,
              fontSize: buttonTextSize,
              fontWeight: buttonTextWeight,
            ),
            textAlign: buttonTextAlignment,
          ),
        ),
      ],
    );
  }
}
