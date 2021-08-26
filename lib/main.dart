import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  Future<void> showFullScreeenDialog(BuildContext context) {
    return showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      context: context,
      pageBuilder: (_, __, ___) {
        return CustomDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await showFullScreeenDialog(context);
          },
          child: Text("Show Dialog"),
        ),
      ),
    );
  }
}

const String DOG_IMAGE =
    "https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";

class CustomDialog extends StatefulWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  int donation = 50;

  int selectedIndex = 1;

  Expanded donationButton(int donationAmount, int index) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              index == selectedIndex ? Colors.red : Colors.orange),
        ),
        onPressed: () {
          setState(() {
            selectedIndex = index;
            donation = donationAmount;
          });
        },
        child: Text(
          "\$$donationAmount",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  SizedBox donationSubmitButton() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.red),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite),
            SizedBox(width: 10),
            Text(
              "Donate \$$donation",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox otherAmountButton() {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: OutlinedButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all<BorderSide>(
              BorderSide(color: Colors.orange)),
        ),
        onPressed: () {},
        child: Text(
          "Other amount",
          style: TextStyle(
            color: Colors.orange,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 40),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: kToolbarHeight),
                  IconButton(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  SizedBox(height: 40),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.4,
                          color: Colors.grey.withOpacity(0.1),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.4 + 40,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                "Save a life.\nDonate Today.",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(height: 60),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Image.network(
                                  DOG_IMAGE,
                                  height: double.infinity,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      donationButton(25, 0),
                      SizedBox(width: 10),
                      donationButton(50, 1),
                      SizedBox(width: 10),
                      donationButton(100, 2),
                    ],
                  ),
                  SizedBox(height: 10),
                  otherAmountButton(),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "\$$donation ",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: "can feed a large dog for a month",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 40),
              child: donationSubmitButton(),
            ),
          ),
        ],
      ),
    );
  }
}
