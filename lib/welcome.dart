import 'package:agwa/aboutus.dart';
import 'package:agwa/waterlevel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/login.dart';

void main() {
  runApp(const welcomePage());
}

// ignore: camel_case_types
class welcomePage extends StatefulWidget {
  const welcomePage({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _welcomePageState createState() => _welcomePageState();
}

// ignore: camel_case_types
class _welcomePageState extends State<welcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 105, 187, 255),
          automaticallyImplyLeading: false,
          title: GestureDetector(
            child: Row(
              children: [
                const FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.white,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                ),
                const Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              // ignore: use_build_context_synchronously
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: ((context) => const loginPage())));
            },
          ),
        ),
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Agwa',
                style: TextStyle(
                    color: Color.fromARGB(255, 105, 187, 255),
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, top: 20),
              child: const Text(
                'Welcome, User!',
                style: TextStyle(
                    color: Color.fromARGB(255, 105, 187, 255),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: const Text(
                'What would you like to do?',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio:
                          1.0, // Set aspect ratio to maintain square shape
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.grey)),
                        child: GestureDetector(
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.water,
                                size: 50,
                                color: Color.fromARGB(255, 105, 187, 255),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Water Level',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 105, 187, 255),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => waterlevelPage())));
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20), // Add spacing between containers
                  Expanded(
                    child: AspectRatio(
                      aspectRatio:
                          1.0, // Set aspect ratio to maintain square shape
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.grey)),
                        child: GestureDetector(
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person,
                                size: 50,
                                color: Color.fromARGB(255, 105, 187, 255),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'About us',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 105, 187, 255),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => aboutusPage())));
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
