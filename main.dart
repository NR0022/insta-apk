import 'package:flutter/material.dart';
import 'dart:html' as html;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  void openHome() {
    html.window.open(
      "https://www.instagram.com/accounts/signup/email/",
      "_blank",
    );
  }

  void open2FA() {
    html.window.open(
      "https://accountscenter.instagram.com/password_and_security/two_factor/",
      "_blank",
    );
  }

  void clearData(BuildContext context) {

    html.window.localStorage.clear();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            "Clear Data",
            style: TextStyle(color: Colors.white),
          ),
          content: Text(
            "All app data cleared successfully.",
            style: TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            )
          ],
        );
      },
    );
  }

  Widget button(String text, VoidCallback action) {
    return ElevatedButton(
      onPressed: action,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),

      home: Builder(
        builder: (context) {

          return Scaffold(
            backgroundColor: Colors.black,

            appBar: AppBar(
              title: Text("Instagram"),
              backgroundColor: Colors.black,
            ),

            body: Column(
              children: [

                Container(
                  color: Colors.red,
                  padding: EdgeInsets.all(10),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      button("HOME", openHome),

                      button("2FA ONE", open2FA),

                      button(
                        "CLEAR DATA",
                        () => clearData(context),
                      ),

                    ],
                  ),
                ),

                Expanded(
                  child: Center(
                    child: Text(
                      "Click HOME or 2FA to open page",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )

              ],
            ),
          );
        },
      ),
    );
  }
}