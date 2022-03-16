import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              children: [
                Image.asset('assets/icons/logo.png',width: MediaQuery.of(context).size.width / 3,),
                SizedBox(height: 10,),
                Text('Welcome Back !',style: TextStyle(fontSize: 26),),
                Text('To Continue, Login Now ',style: TextStyle(fontSize: 14,color: Colors.black54),),
                SizedBox(height: MediaQuery.of(context).size.height / 3,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
