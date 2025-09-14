import 'package:flutter/material.dart';
import 'package:islami/models/sura.dart';
import '../../../../../core/theme/app_colors.dart';

class SuraCard extends StatelessWidget {
  final Sura sura;
  const SuraCard({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/sura.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Text(
              sura.id.toString(),
              style: const TextStyle(
                color: AppColor.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'jana',
              ),
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sura.suraNameEn,
                  style: const TextStyle(
                    color: AppColor.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'jana',
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  sura.ayaNumbers,
                  style: const TextStyle(
                    color: AppColor.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'jana',
                  ),
                ),
              ],
            ),
          ),
          Text(
            sura.suraNameAr,
            style: const TextStyle(
              color: AppColor.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'jana',
            ),
          ),
        ],
      ),
    );
  }
}
