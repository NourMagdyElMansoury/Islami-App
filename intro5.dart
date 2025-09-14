import 'package:flutter/material.dart';
import 'intro4.dart';
import 'package:islami/modules/layout/home.dart'; // main home after intro

class Intro5Screen extends StatelessWidget {
  const Intro5Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Center(child: Image.asset("assets/images/radio.png"))),
          const Text(
            "Holy Quran Radio , You can listen to the holy quran radio",
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
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Intro4Screen()));
                  },
                  child: const Text("Back"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Home()));
                  },
                  child: const Text("Finish"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
