import 'package:flutter/material.dart';

class Uihelper {
  static CustomTextField(TextEditingController controller, String text,
      IconData iconData, bool bIsVisible) {
    try {
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: TextField(
            controller: controller,
            obscureText: bIsVisible,
            decoration: InputDecoration(
                hintText: text,
                prefixIcon: Icon(iconData),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25))),
          ));
    } catch (e) {
      print("exception occur");
      //Handle Exception
    }
  }

  static CustomButton(VoidCallback voidCallback, String text) {
    return SizedBox(
      height: 50,
      width: 190,
      child: ElevatedButton(
        onPressed: () {
          voidCallback();
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
        child: Text(
          text,
          style: const TextStyle(color: Colors.blue, fontSize: 30),
        ),
      ),
    );
  }

  static CustomAlertBox(BuildContext context, String text) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(text),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"))
            ],
          );
        });
  }
}
