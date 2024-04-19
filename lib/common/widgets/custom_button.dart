import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  final Color? color;
  const CustomButton({super.key, required this.text, required this.ontap,this.color});

  @override
  Widget build(context) {
    return ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(minimumSize:  Size(double.infinity,50),primary: color),
        child: Center(
          child: Text(text,style: TextStyle(color: color==null ?Colors.white:Colors.black),),
        ));
  }
}
