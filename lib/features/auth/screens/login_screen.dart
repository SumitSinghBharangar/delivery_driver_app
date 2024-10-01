import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vehicle_app/common/buttons/dynamic_button.dart';
import 'package:vehicle_app/common/components/custom_textfield.dart';
import 'package:vehicle_app/common/components/laguage_button.dart';
import 'package:vehicle_app/features/auth/screens/otp_screen.dart';
import 'package:vehicle_app/features/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phone = TextEditingController();
  bool isFieldValidate = false;


  @override
  void dispose() {
    _phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Spacer(),
                    LaguageButton(),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "What's your mobile\nnumber?\n",
                        style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: "\nWe'll text a code to verify your phone",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  hintText: "",
                  controller: _phone,
                  autofocus: true,
                  removeFocusOutside: true,
                  isNumber: true,
                )
              ],
            ),
          ),
          Positioned(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "By continuing, you agree to ",
                        style: TextStyle(color: Colors.black, fontSize: 12.sp),
                      ),
                      TextSpan(
                        text: "Term of Sercive ",
                        style: TextStyle(
                            color: Colors.deepPurple, fontSize: 12.sp),
                      ),
                      TextSpan(
                        text: "& ",
                        style: TextStyle(color: Colors.black, fontSize: 12.sp),
                      ),
                      TextSpan(
                        text: "Privacy Policy ",
                        style: TextStyle(color: Colors.black, fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.h,),
                DynamicButton.fromText(
                  color: isFieldValidate ? Colors.grey : Colors.purple,
                  textColor: isFieldValidate ? Colors.white : Colors.grey,
                  text: "Get OTP",
                   onPressed: (){
                    if(isFieldValidate){
                      Utils.go(context: context, screen: const OtpScreen());
                    }
                })
              ],
            ),
          ))
        ],
      ),
    );
  }
}
