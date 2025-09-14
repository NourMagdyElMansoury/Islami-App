import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count = 0;
  int phraseIndex = 0;

  final List<String> phrases = [
    "سبحان الله",
    "الله أكبر",
    "الحمد لله",
    "استغفر الله"
  ];

  void incrementTasbeeh() {
    setState(() {
      count++;
      if (count == 32) {
        count = 0;
        phraseIndex++;
        if (phraseIndex >= phrases.length) {
          phraseIndex = 0; // Restart after finishing all
        }
      }
    });
  }

  void resetTasbeeh() {
    setState(() {
      count = 0;
      phraseIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,   // ✅ full width
        height: double.infinity,  // ✅ full height
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bearish.png"),
            fit: BoxFit.cover, // ✅ makes image cover whole screen
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Phrase text
            Text(
              phrases[phraseIndex],
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 6,
                    offset: Offset(2, 2),
                  )
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Bead Circle showing count
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.teal.shade700.withOpacity(0.9),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.teal.shade900.withOpacity(0.7),
                    blurRadius: 12,
                    spreadRadius: 2,
                    offset: const Offset(0, 6),
                  )
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                "$count",
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Big round click button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.all(40),
                elevation: 8,
              ),
              onPressed: incrementTasbeeh,
              child:
              const Icon(Icons.fingerprint, size: 50, color: Colors.white),
            ),

            const SizedBox(height: 20),

            // Reset button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              onPressed: resetTasbeeh,
              child: const Text(
                "إعادة التصفير",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
