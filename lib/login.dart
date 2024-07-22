import 'package:flutter/material.dart';
import '/services.dart';
import '/welcome.dart';

void main() {
  runApp(const loginPage());
}

// ignore: camel_case_types
class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _loginPage createState() => _loginPage();
}

// ignore: use_key_in_widget_constructors, must_be_immutable, camel_case_types
class _loginPage extends State<loginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double logoWidth = 0;
    double textsmall = 0;
    double paddingContainer = 0;
    double inputWidth = 0;
    double inputHeight = 0;
    double buttonWidth = 0;
    double buttonSpace = 0;

    if (deviceWidth <= 390) {
      logoWidth = deviceWidth / 1.8;
      textsmall = deviceWidth / 25; // Adjust the percentage as needed
      paddingContainer = deviceWidth / 12; // Adjust the percentage as needed
      inputWidth = deviceWidth * 0.8;
      inputHeight = 50;
      buttonWidth = deviceWidth * 0.4;
      buttonSpace = deviceWidth * 0.08;
    } else if (deviceWidth <= 480) {
      logoWidth = deviceWidth / 1.5;
      textsmall = deviceWidth / 25; // Adjust the percentage as needed
      paddingContainer = deviceWidth / 12;
      inputWidth = deviceWidth * 0.8;
      inputHeight = 50;
      buttonWidth = deviceWidth * 0.4;
      buttonSpace = deviceWidth * 0.03;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
        padding: EdgeInsets.symmetric(horizontal: paddingContainer),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
            ),
            SizedBox(
              width: logoWidth,
              child: const Image(image: AssetImage('images/logo.png')),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 105, 187, 255),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 105, 187, 255),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: inputWidth,
                      height: inputHeight,
                      child: TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 105, 187, 255),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: inputWidth,
                      height: inputHeight,
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: buttonSpace),
            ),
            Container(
              width: buttonWidth,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 105, 187, 255),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 105, 187, 255),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        width: buttonWidth,
                        child: TextButton(
                            onPressed: () {
                              Services()
                                  .singIn(emailController.text,
                                      passwordController.text)
                                  .then((value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const welcomePage()));
                              }).catchError((error) {
                                // Handle sign-in errors here
                                String errorMessage =
                                    'An error occurred during sign-in. Please check your credentials.';
                                // Show an error dialog or display the error message in some way
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Sign-In Error'),
                                      content: Text(errorMessage),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // Close the dialog
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              });
                            },
                            child: Text(
                              'Log in',
                              style: TextStyle(
                                  fontSize: textsmall, color: Colors.white),
                            ))),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
