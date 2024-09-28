import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:vehicle_app/common/buttons/dynamic_button.dart';
import 'package:vehicle_app/common/buttons/scale_button.dart';
import 'package:vehicle_app/common/components/laguage_button.dart';

import 'package:vehicle_app/features/auth/screens/onbording_screens/onbordingpage.dart';

import 'package:vehicle_app/features/utils/utils.dart';

import '../../../language/language_screen.dart';

class OnBordringScreen extends StatefulWidget {
  const OnBordringScreen({super.key});

  @override
  State<OnBordringScreen> createState() => _OnBordringScreenState();
}

class _OnBordringScreenState extends State<OnBordringScreen> {
  PageController pageController = PageController();

  double page = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusManager.instance.primaryFocus?.unfocus();
    });
    pageController.addListener(() {
      setState(() {
        page = pageController.page ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: const [
                OnBoardPage(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 65, 55, 244),
                        Color.fromARGB(255, 120, 3, 183)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  color: Colors.purple,
                  text1: "Earn upto\n₹40,000 monthly",
                  text2: "plus additional joining and\nreferral incentives",
                  imageaddress: "assets/images/money.png",
                ),
                OnBoardPage(
                  color: Colors.orange,
                  text1: "We care for\nyour safety!",
                  text2:
                      "Free insurance and early payout access for all our riders",
                  imageaddress: "assets/images/rupee.png",
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.orange, Color.fromARGB(255, 148, 92, 8)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                OnBoardPage(
                  color: Colors.red,
                  text1: "Work within\nyour own area",
                  text2:
                      "Short distance and quick deliveries\nwithin your area",
                  imageaddress: "assets/images/google_map.png",
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.red, Color.fromARGB(255, 172, 16, 5)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                OnBoardPage(
                  color: Colors.green,
                  text1: "No vechicle?\nNo problem.",
                  text2: "Get free vehicle assistence\nfrom Zepto",
                  imageaddress: "assets/images/scooter.png",
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.green, Color.fromARGB(255, 12, 110, 15)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 50.h,
            right: 20.w,
            child: const LaguageButton(),
          ),
          Positioned(
            bottom: 30,
            left: 50,
            right: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: 4,
                  effect: const WormEffect(
                    activeDotColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                // ScaleButton(

                //     scale: 0.98,
                //     onTap: () {},
                //     child: Container(
                //       child: Text("Next"),
                //     ))
                DynamicButton.fromText(
                    color: Colors.white,
                    foregroundColor: Colors.purple,
                    text: "Next",
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (page + 1 >= 4) {
                        // context.go(Routes.login.path);
                      }
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.fastEaseInToSlowEaseOut);
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
