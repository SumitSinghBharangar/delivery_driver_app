import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vehicle_app/common/buttons/dynamic_button.dart';
import 'package:vehicle_app/common/buttons/scale_button.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? selectedLanguage = 'English';

  final languages = [
    {'name': 'English', 'code': 'English', "ch": "En"},
    {'name': 'Hindi', 'code': 'हिन्दी', "ch": "ह"},
    {'name': 'Kannada', 'code': 'ಕನ್ನಡ', "ch": "ಕ"},
    {'name': 'Telugu', 'code': 'తెలుగు', "ch": "తె"},
    {'name': 'Tamil', 'code': 'தமிழ்', "ch": "த"},
    {'name': 'Bengali', 'code': 'বাংলা', "ch": "বা"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose App Language',
          style: TextStyle(
            fontSize: 26.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        'Choose the language you want to see in the entire app',
                    style: TextStyle(
                      fontSize: 19.sp,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 15.h,
                      );
                    },
                    itemCount: languages.length,
                    itemBuilder: (context, index) {
                      return AnimatedContainer(
                        duration: const Duration(microseconds: 1500),
                        decoration: BoxDecoration(
                            color: selectedLanguage == languages[index]['name']
                                ? Colors.purple.shade100.withOpacity(0.4)
                                : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: EdgeInsets.only(right: 23.w),
                          child: Row(
                            children: [
                              Flexible(
                                child: RadioListTile(
                                  title: Text(
                                    languages[index]['code']!,
                                    style: TextStyle(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    languages[index]['name']!,
                                    style: TextStyle(fontSize: 20.sp),
                                  ),
                                  value: languages[index]['name'],
                                  groupValue: selectedLanguage,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedLanguage = value as String?;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                languages[index]['ch']!,
                                style: TextStyle(
                                    fontSize: 29.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 20,
              left: 30,
              right: 30,
              child: DynamicButton.fromText(
                  text: "Continue",
                  onPressed: () {
                    Navigator.pop(context);
                  })),
        ],
      ),
    );
  }
}
