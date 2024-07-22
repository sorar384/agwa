import 'package:agwa/welcome.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class waterlevelPage extends StatefulWidget {
  waterlevelPage({Key? key}) : super(key: key);

  @override
  waterlevelPageState createState() => waterlevelPageState();
}

class waterlevelPageState extends State<waterlevelPage> {
  DatabaseReference reference =
      FirebaseDatabase.instance.reference().child('water_level/percentage');
  DatabaseReference reference2 =
      FirebaseDatabase.instance.reference().child('water_level/distance');
  int percentage = 0;
  double distance = 0.00;

  @override
  void initState() {
    super.initState();

    reference.onValue.listen((event) {
      final value = event.snapshot.value;
      if (value != null) {
        try {
          percentage = int.parse(value.toString());
          print('Temperature updated: $percentage');
          setState(() {});
        } catch (e) {}
      } else {}
    }, onError: (error) {});
    reference2.onValue.listen((event) {
      final value = event.snapshot.value;
      if (value != null) {
        try {
          distance = double.parse(value.toString());
          print('Temperature updated: $distance');
          setState(() {});
        } catch (e) {}
      } else {}
    }, onError: (error) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 0),
              padding: EdgeInsets.all(70),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/torus.png'),
                  fit: BoxFit.contain,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 80),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '$percentage%',
                            style: const TextStyle(
                              fontSize: 50,
                              color: Colors.blue,
                              fontWeight: FontWeight.w700,
                              height: 1.0, // Remove spacing between lines
                            ),
                          ),
                          const TextSpan(
                            text: '\n', // Add line break here
                          ),
                          TextSpan(
                            text: '${distance}cm',
                            style: const TextStyle(
                              fontSize: 25,
                              color: Colors.blue,
                              fontWeight: FontWeight.w700,
                              height: 1.0, // Remove spacing between lines
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 70),
              child: const Text(
                'Your water level as of now...',
                style: TextStyle(
                    fontSize: 17,
                    color: Color.fromARGB(255, 105, 187, 255),
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 150),
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
                              builder: ((context) => const welcomePage()),
                            ),
                          );
                        },
                        child: const Text(
                          'Back to Home',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
