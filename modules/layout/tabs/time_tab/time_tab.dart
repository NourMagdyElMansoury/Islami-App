import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:islami/modules/layout/morning_azkar_screen.dart';
import 'package:islami/modules/layout/evening_azkar_screen.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Get today's date
    DateTime now = DateTime.now();
    String formattedDate = DateFormat("dd MMM, yyyy").format(now); // e.g. 14 Sep, 2025
    String dayName = DateFormat("EEEE").format(now); // e.g. Sunday

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A), // dark background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Title
              Text(
                "Islami",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber[200],
                ),
              ),
              const SizedBox(height: 20),

              // Date
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formattedDate,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const Text(
                    "Hijri Date Here",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                "Pray Time - $dayName",
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const SizedBox(height: 20),

              // Prayer Times
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF2E2E2E),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildPrayerTime("Duhr", "01:01 PM"),
                        _buildPrayerTime("Asr", "04:38 PM", isActive: true),
                        _buildPrayerTime("Maghrib", "07:57 PM"),
                        _buildPrayerTime("Isha", "09:05 PM"),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Next Prayer: 02:32",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Azkar Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildAzkarCard(
                    context,
                    "Evening Azkar",
                    "🌙",
                    const  EveningAzkarScreen(),
                  ),
                  _buildAzkarCard(
                    context,
                    "Morning Azkar",
                    "☀️",
                    const MorningAzkarScreen(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPrayerTime(String title, String time, {bool isActive = false}) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.amber : Colors.white70,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          time,
          style: TextStyle(
            color: isActive ? Colors.amber : Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildAzkarCard(
      BuildContext context, String title, String icon, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => screen),
        );
      },
      child: Container(
        width: 140,
        height: 150,
        decoration: BoxDecoration(
          color: const Color(0xFF2E2E2E),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(icon, style: const TextStyle(fontSize: 40)),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
