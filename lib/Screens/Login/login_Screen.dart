import 'package:flutter/material.dart';
import 'package:instagram/Screens/SignUp/signup_screen.dart';
import 'package:instagram/Screens/bottomnav/bottom_nav_screen.dart';
import 'package:instagram/Widgets/uihelper.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("Login Screen"),
        centerTitle: true,
        // backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Uihelper.CustomImage(imgurl: 'TextLogo.png'),
            SizedBox(height: 20),
            Uihelper.CustomTextField(
              controller: emailController,
              text: "Email",
              tohide: false,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10),
            Uihelper.CustomTextField(
              controller: passwordController,
              text: "Password",
              tohide: true,
              textInputType: TextInputType.text,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 242),
                  child: Uihelper.CustomTextButton(
                    text: 'Forgot Password?',
                    callback: () {},
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Uihelper.CustomButton(
              callback: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => BottomNavScreen()),
                );
              },
              buttonName: "Log In",
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Uihelper.CustomImage(imgurl: 'Icon.png'),
                Uihelper.CustomTextButton(
                  text: "Log in with Facebook",
                  callback: () {},
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'OR',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                Uihelper.CustomTextButton(
                  text: "Sign Up",
                  callback: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
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
