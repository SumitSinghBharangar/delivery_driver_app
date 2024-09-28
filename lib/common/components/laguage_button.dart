import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vehicle_app/common/buttons/scale_button.dart';
import 'package:vehicle_app/features/language/language_screen.dart';
import 'package:vehicle_app/features/utils/utils.dart';

class LaguageButton extends StatelessWidget {
  const LaguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaleButton(
      scale: .97,
      onTap: () {
        Utils.go(
          context: context,
          screen: const LanguageSelectionScreen(),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.white),
          borderRadius: BorderRadius.circular(15),
        ),
        padding:
            EdgeInsetsDirectional.symmetric(vertical: 5.h, horizontal: 15.w),
        child: Row(
          children: [
            const Icon(
              Icons.g_translate_sharp,
              color: Colors.white,
            ),
            SizedBox(
              width: 2.w,
            ),
            const Text(
              "English",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
