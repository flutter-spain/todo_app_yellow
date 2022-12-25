import 'package:flutter/material.dart';
import 'package:todo_app_yellow/components/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;

  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({super.key, 
        required this.controller,
        required this.onSave,
        required this.onCancel
        });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.yellow[300],
        content: Container(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          // get user Input
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter task name',
              hintStyle: TextStyle(
                color: Colors.black,
              ),
            ),
          ),

          // Add button
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              // Save button
              
              MyButton(text: "Save", onPressed: onSave),
              const SizedBox(width: 4),

              // Cancel button
              MyButton(text: "Cancel", onPressed: onCancel),

          ],)

        ])
        ),
        

    );
  }
}