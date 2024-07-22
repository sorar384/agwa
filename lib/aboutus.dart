import 'package:agwa/welcome.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class aboutusPage extends StatefulWidget {
  aboutusPage({Key? key}) : super(key: key);

  @override
  aboutusPageState createState() => aboutusPageState();
}

class aboutusPageState extends State<aboutusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 70, left: 20),
            child: const Text(
              'About Agwa',
              style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 105, 187, 255),
                  fontWeight: FontWeight.w700),
            ),
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 130),
              margin: const EdgeInsets.only(top: 40, left: 20),
              child: Image(
                image: AssetImage('images/waterlevel.png'),
              )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            margin: const EdgeInsets.only(top: 40),
            child: const Text(
                'In many communities, water scarcity is a harsh reality. The struggle to access clean and reliable water sources is a daily challenge for countless individuals and families. Agwa was born out of the desire to address this pressing issue and empower communities to manage their water resources effectively.',
                style: TextStyle(
                  fontSize: 15,
                )),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            margin: const EdgeInsets.only(top: 20),
            child: const Text(
                'Our mission is to empower individuals and communities to monitor, manage, and conserve their water resources efficiently. By providing innovative solutions like Agwa, we aim to make a positive impact on water accessibility and sustainability worldwide.',
                style: TextStyle(
                  fontSize: 15,
                )),
          ),
          Container(
            margin: const EdgeInsets.only(top: 80),
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
                                    builder: ((context) =>
                                        const welcomePage())));
                          },
                          child: const Text(
                            'Back to Home',
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
