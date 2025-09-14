import 'package:flutter/material.dart';
import 'package:islami/core/app_const/app_const.dart';
import 'package:islami/core/excisions/excisions.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/models/sura.dart';
import 'package:islami/modules/layout/tabs/quran_tab/widgets/sura_card.dart';
import 'package:islami/modules/layout/tabs/quran_tab/widgets/sura_seatch_text_field.dart';
import 'package:islami/modules/sura_details/sura_details.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  TextEditingController search = TextEditingController();
  List<Sura> quran = [];
  List<Sura> searched = [];

  @override
  void initState() {
    super.initState();
    readQuran();
    search.addListener(() {
      if (search.text.isEmpty) {
        searched = quran;
      } else {
        searched = quran
            .where(
              (sura) =>
          sura.suraNameEn.trim().toLowerCase().contains(
            search.text.trim().toLowerCase(),
          ) ||
              sura.suraNameAr.trim().contains(search.text.trim()),
        )
            .toList();
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/quran.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset('assets/images/quran.jpg')),
            SizedBox(height: 20),
            SuraSeatchTextField(controller: search),
            SizedBox(height: 20),
            Text(
              'Suras List',
              style: context.appTextTheme.bodyMedium,
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemCount: searched.length,
                itemBuilder: (_, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SuraDetails(sura: searched[index]),
                      ),
                    );
                  },
                  child: SuraCard(sura: searched[index]),
                ),
                separatorBuilder: (_, index) => Divider(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  void readQuran() {
    for (int i = 0; i < arabicAuranSuras.length; i++) {
      quran.add(
        Sura(
          id: i + 1,
          ayaNumbers: AyaNumber[i],
          suraNameAr: arabicAuranSuras[i],
          suraNameEn: englishQuranSurahs[i],
        ),
      );
    }
    searched = quran;
  }
}
