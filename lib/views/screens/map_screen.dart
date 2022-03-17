import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_medical/shared/components/components.dart';
import 'package:hospital_medical/views/screens/login_screen.dart';

import '../widgets/material_button.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
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
                children: [
                  Text(
                    "Prototype Map",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      materialButtonCustom(
                          text: 'Doctor',
                          onPressed: () {
                            navigator(context, LoginScreen());
                          }),
                      materialButtonCustom(text: 'Receptionist', onPressed: () {}),
                      materialButtonCustom(text: 'Nurse', onPressed: () {}),
                      materialButtonCustom(text: 'Analysis Employee', onPressed: () {}),
                      materialButtonCustom(text: 'Manger', onPressed: () {}),
                      materialButtonCustom(text: 'HR', onPressed: () {}),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
