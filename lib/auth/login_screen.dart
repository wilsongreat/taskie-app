import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:taskie_app/auth/signup_screen.dart';
import 'package:taskie_app/pages/main_page.dart';
import 'package:taskie_app/widgets/my_button.dart';
import 'package:taskie_app/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // nav() {
  //   Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpScreen()));
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: FadeInDown(
              duration: Duration(milliseconds: 900),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height / 7,
                  ),
                  Text(
                    'Welcome back!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Sign in to your account to get access',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Form(
                      child: Container(
                    height: size.height / 1.6,
                    child: ListView(
                      children: [
                        InputField(
                          inputController: emailController,
                          isPassword: false,
                          hasSuffixIcon: false,
                          hintText: 'Email Address',
                          prefixIcon: Image.asset(
                            'assets/Icon_email.png',
                            color: Color(0xFF333333).withOpacity(0.8),
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        InputField(
                          inputController: passwordController,
                          hasSuffixIcon: true,
                          isPassword: true,
                          hintText: 'Password',
                          prefixIcon: Image.asset(
                            'assets/Icon_password.png',
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                height: 1.3),
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        MyButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => MainPage()));
                            },
                            text: 'Login'),
                        SizedBox(
                          height: 20.0,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              socialLinks('assets/google.png', 30),
                              socialLinks('assets/apple.png', 20),
                              socialLinks('assets/facebook.png', 20),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Center(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don’t have an account? ',
                                  style: TextStyle(
                                      wordSpacing: 3,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => SignUpScreen()));
                                  },
                                  child: Text(
                                    'Sign up ',
                                    style: TextStyle(
                                        color: Color(0xFF3D16D6),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                )
                              ]),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            )),
      ),
    );
  }
}

Widget socialLinks(String imageUrl, double? imgHeight) {
  return Container(
    margin: EdgeInsets.only(right: 10.0),
    height: 50.0,
    width: 50.0,
    decoration: BoxDecoration(
        shape: BoxShape.circle, color: Color(0xFF333333).withOpacity(0.08)),
    child: Image.asset(
      imageUrl,
      height: imgHeight ?? 10.0,
    ),
  );
}
