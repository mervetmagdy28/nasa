import 'package:flutter/material.dart';
import '../constants.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({Key? key, required this.Controller, required this.label})
      : super(key: key);
  TextEditingController Controller;
  String label;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: Controller,
      validator: label=="Password"?(value){
        value=value!.trim();
        if (value != null && value.length >= 6 && value.isNotEmpty) {
          return null;
        } else {
          return "invalid password";
        }
      }:(value){
        if (value != null &&
            value.contains("@") &&
            value.contains(".com") &&
            value.isNotEmpty) {
          return null;
        } else {
          return "invalid email";
        }
      },
      obscureText: label=="Password"?true:false,
      keyboardType: label=="Password"?TextInputType.visiblePassword:TextInputType.emailAddress,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: "enter your ${label.toLowerCase()}",
        label: Text(label),
        labelStyle: TextStyle(color: kPrimaryColor),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey)),
      ),
    );
  }
}

