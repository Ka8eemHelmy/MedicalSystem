import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_medical/shared/components/TextFields.dart';
import 'package:hospital_medical/shared/components/constant.dart';
import 'package:hospital_medical/views/widgets/text.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

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
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        'assets/icons/logo.png',
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.height / 6,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Welcome Back !',
                        style: TextStyle(fontSize: 26),
                      ),
                      Text(
                        'To Continue, Login Now ',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 15,
                      ),
                      buildTextField(
                          emailController,
                          'Phone Number',
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              SvgPicture.asset(
                                'assets/icons/phone.svg',
                                semanticsLabel: 'phone icon',
                                fit: BoxFit.cover,
                                width: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SvgPicture.asset(
                                'assets/icons/Cursor.svg',
                                semanticsLabel: 'cursor icon',
                                fit: BoxFit.cover,
                                // width: 10,
                                height: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          type: TextInputType.number,
                          status: TextInputAction.next,
                          validate: (value) {
                        if (value!.isEmpty && value.trim().isEmpty) {
                          return "Please, Enter Your Phone !";
                        } else if (value.length != 11) {
                          return "Please, Enter a valid Phone Number must be 11 digit";
                        }
                        return null;
                      }),
                      SizedBox(
                        height: 20,
                      ),
                      buildTextField(
                        passwordController,
                        'Password',
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              'assets/icons/lock.svg',
                              semanticsLabel: 'lock icon',
                              fit: BoxFit.cover,
                              width: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              'assets/icons/Cursor.svg',
                              semanticsLabel: 'cursor icon',
                              fit: BoxFit.cover,
                              // width: 10,
                              height: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        type: TextInputType.text,
                        status: TextInputAction.done,
                        validate: (value) {
                          if (value!.isEmpty && value.trim().isEmpty) {
                            return "Please, Enter Your Password !";
                          } else if (value.length < 8) {
                            return "Please, Enter a valid Password";
                          } else if (!validateStructure(value)) {
                            return "Please, Enter a valid Password with at Least 1 Upper case and 1 Lower Case and 1 Digit and 1 Special Character";
                          }
                          return null;
                        },
                        canObscure: true
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 20),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: textCustom('Forget Password ?'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              print('right');

                            }
                          },
                          child: Text(
                            "Login",
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: primaryColor,
                            minimumSize: const Size.fromHeight(50),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // ImageIcon(image)
            // TextFormField(
            //   decoration: InputDecoration(prefixIcon: Row(children: [
            //
            //   ],)),
            // ),
          ],
        ),
      ),
    );
  }
}

bool validateStructure(String value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$.&*~]).{8,}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}
