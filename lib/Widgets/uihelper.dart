import 'package:flutter/material.dart';

class Uihelper {
  static CustomTextButton({
    required String text,
    required VoidCallback callback,
  }) {
    return TextButton(
      onPressed: callback,
      child: Text(
        text,
        style: TextStyle(fontSize: 12, color: Color(0XFF37972Ef)),
      ),
    );
  }

  static CustomTextField({
    required TextEditingController controller,
    required String text,
    required bool tohide,
    required TextInputType textInputType,
  }) {
    return Container(
      height: 44,
      width: 343,
      decoration: BoxDecoration(
        color: Color(0XFF121212),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.white24, width: 0.5),
      ),

      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: TextField(
          controller: controller,
          obscureText: tohide,
          keyboardType: textInputType,
          decoration: InputDecoration(
            hintText: text,
            border: InputBorder.none,
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  static CustomImage({required String imgurl}) {
    return Image.asset('assets/image/$imgurl');
  }

  static CustomButton({
    required VoidCallback callback,
    required String buttonName,
  }) {
    return SizedBox(
      height: 45,
      width: 343,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0XFF3797EF),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        onPressed: () {
          callback();
        },
        child: Text(
          buttonName,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }
}
