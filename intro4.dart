import 'package:flutter/material.dart';
import 'intro3.dart';
import 'intro5.dart';

class Intro4Screen extends StatelessWidget {
  const Intro4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Center(child: Image.asset("assets/images/reading.png"))),
          const Text(
            "Bearish (Dua) , Praise the name of your lord",
            style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "jana"),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Intro3Screen()));
                  },
                  child: const Text("Back"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const Intro5Screen()));
                  },
                  child: const Text("Next"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
