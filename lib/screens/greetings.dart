import 'package:flutter/material.dart';

import 'home.dart';

class GreetingsPage extends StatelessWidget {
  const GreetingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(child: Center()),
            const Text(
              "Notes App",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Take immediate notes which you never wanna see again ;)",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
            const Expanded(child: Center()),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                  child: const Text("Start Taking Notes")),
            )
          ],
        ),
      ),
    );
  }
}
