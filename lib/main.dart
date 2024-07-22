import 'firebase_options.dart';

import 'login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

// ignore: use_key_in_widget_constructors, must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: _MyApp());
  }
}

class _MyApp extends StatefulWidget {
  const _MyApp({Key? key}) : super(key: key);
  @override
  __MyApp createState() => __MyApp();
}

class __MyApp extends State<_MyApp> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          YourScaffoldContent(),
        ],
      ),
    );
  }
}

class YourScaffoldContent extends StatelessWidget {
  const YourScaffoldContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 50),
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 13),
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.center,
              child: const SizedBox(
                child: Image(
                  width: 250,
                  image: AssetImage('images/logo.png'),
                ),
              )),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text(
              'Welcome to Agwa',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 105, 187, 255)),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text(
              'Your Water Tank Level Monitoring Solution',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text(
              'Predicting Gcash Mode',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 105, 187, 255),
                          borderRadius: BorderRadius.circular(25)),
                      height: 50,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => const loginPage())));
                          },
                          child: const Text(
                            'Get Started',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
