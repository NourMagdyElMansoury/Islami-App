import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:audioplayers/audioplayers.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int? playingIndex; // keeps track of which station is playing

  final List<Map<String, String>> radioStations = [
    {
      "name": "📻 Quran Radio Saudi",
      "url": "https://stream.radiojar.com/8s5u5tpdtwzuv"
    },
    {
      "name": "🕋 Makkah Live",
      "url": "http://live.quran.ma:8000/radio.mp3"
    },
    {
      "name": "🎙️ Quran Radio Kuwait",
      "url": "http://qurango.net/radio/quran/128"
    },
    {
      "name": "🎧 Mishary Rashid Alafasy",
      "url": "http://qurango.net/radio/mishary/128"
    },
  ];

  Future<void> togglePlay(int index) async {
    if (playingIndex == index) {
      // stop playing
      await _audioPlayer.stop();
      setState(() {
        playingIndex = null;
      });
    } else {
      // stop current first
      await _audioPlayer.stop();

      final url = radioStations[index]["url"]!;
      try {
        await _audioPlayer.play(UrlSource(url));
        debugPrint("▶️ Playing: $url");

        setState(() {
          playingIndex = index;
        });
      } catch (e) {
        debugPrint("❌ Error starting stream: $e");
        setState(() {
          playingIndex = null;
        });
      }
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1A1A1A),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: radioStations.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final isPlaying = playingIndex == index;

            return Container(
              decoration: BoxDecoration(
                color: const Color(0xFFE9C46A),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                title: Text(
                  radioStations[index]["name"]!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        isPlaying ? Iconsax.pause : Iconsax.play,
                        color: Colors.black,
                        size: 28,
                      ),
                      onPressed: () => togglePlay(index),
                    ),
                    const SizedBox(width: 10),
                    const Icon(Iconsax.heart, color: Colors.black, size: 24),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
