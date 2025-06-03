import 'package:flutter/material.dart';
import 'package:instagram/Screens/Login/login_Screen.dart';
import 'package:instagram/Widgets/uihelper.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Uihelper.CustomImage(imgurl: 'TextLogo.png'),
            SizedBox(height: 30),
            Uihelper.CustomTextField(
              controller: emailController,
              text: 'Email',
              tohide: false,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10),
            Uihelper.CustomTextField(
              controller: passwordController,
              text: 'Password',
              tohide: true,
              textInputType: TextInputType.text,
            ),
            SizedBox(height: 10),
            Uihelper.CustomTextField(
              controller: usernamecontroller,
              text: 'Username',
              tohide: false,
              textInputType: TextInputType.name,
            ),
            SizedBox(height: 30),
            Uihelper.CustomButton(callback: () {}, buttonName: 'Sign Up'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an Account?',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                Uihelper.CustomTextButton(
                  text: "Sign In",
                  callback: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
