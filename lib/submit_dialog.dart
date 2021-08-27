import 'dart:ui';

import 'package:flutter/material.dart';

class SubmitDialog extends StatelessWidget {
  final int donatedAmount;
  const SubmitDialog({
    Key? key,
    required this.donatedAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Center(
        child: Container(
          height: 250,
          width: double.infinity,
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Container(
                  margin: EdgeInsets.only(top: 50),
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: double.infinity,
                  child: DefaultTextStyle(
                    style: TextStyle(color: Colors.black),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 30),
                        Text(
                          "Donated \$$donatedAmount",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Thank you for donation. We assure your donation is for a good cause!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            height: 40,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red),
                              ),
                              child: Text("Continue"),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.done,
                      size: 30,
                      color: Colors.white,
                    ),
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
