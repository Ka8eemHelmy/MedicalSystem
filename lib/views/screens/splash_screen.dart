import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_medical/views/screens/map_screen.dart';
import 'package:hospital_medical/shared/components/components.dart';
import 'package:hospital_medical/shared/components/constant.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white,
        ),
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset(
              'assets/images/Rectangle 3.svg',
              semanticsLabel: 'Rectangle Logo',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(
              'assets/images/Rectangle 2.svg',
              semanticsLabel: 'Rectangle Logo',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment : CrossAxisAlignment.center,
              children: [
                Image.asset('assets/icons/logo_with_title.png',
                    width: MediaQuery.of(context).size.width / 2.9),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Center(
                    child: LinearPercentIndicator(
                      //width: MediaQuery.of(context).size.width - 100,
                      animation: true,
                      lineHeight: 7.0,
                      animationDuration: 3000,
                      percent: 1,
                      barRadius: Radius.circular(50),
                      progressColor: primaryColor,
                      onAnimationEnd: () {
                        navigatorAndRemove(
                          context,
                          MapScreen(),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  'Loading ...',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
