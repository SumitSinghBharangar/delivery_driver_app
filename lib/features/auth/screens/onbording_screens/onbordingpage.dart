// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardPage extends StatelessWidget {
  final Color color;
  final BoxDecoration decoration;
  final String text1;
  final String text2;
  final String imageaddress;
  const OnBoardPage({
    super.key,
    required this.decoration,
    required this.color,
    required this.text1,
    required this.text2,
    required this.imageaddress,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: decoration,
        child: Column(
          children: [
            const Spacer(
              flex: 2,
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                imageaddress,
                height: 190,
                width: 190,
                fit: BoxFit.cover,
              ),
              // child: Container(
              //   height: 200,
              //   width: 200,
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     // color: Colors.transparent.withOpacity(0.96),
              //     image: DecorationImage(
              //         image: AssetImage(imageaddress), fit: BoxFit.cover),
              //   ),
              // ),
            ),
            const Spacer(
              flex: 1,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(color: Colors.white),
                children: [
                  TextSpan(
                    text: text1,
                    style: TextStyle(
                      fontSize: 31.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(text: "\n\n\n"),
                  TextSpan(
                    text: text2,
                    style: TextStyle(fontSize: 23.sp),
                  ),
                ],
              ),
            ),
            Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
