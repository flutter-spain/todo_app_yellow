// stls

/*
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
*/

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  MyButton({super.key, 
      required this.text,
      required this.onPressed
      });

  

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(text),
      color: Theme.of(context).primaryColor,
      textColor: Colors.black,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(12),
      // ),
    );
  }
}