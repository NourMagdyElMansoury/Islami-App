import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/modules/hadeth_details/hadeth_details.dart';
import 'package:islami/models/hadeth.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> hadethList = [];

  @override
  void initState() {
    super.initState();
    loadHadethList();
  }

  Future<void> loadHadethList() async {
    List<Hadeth> loadedHadiths = [];

    for (int i = 1; i <= 50; i++) {
      try {
        final content = await rootBundle.loadString('assets/hadeth/$i.txt');
        final hadith = Hadeth.fromFileContent(content);
        loadedHadiths.add(hadith);
      } catch (e) {
        debugPrint("❌ Could not load hadith $i: $e");
        break; // stop when no more files exist
      }
    }

    setState(() {
      hadethList = loadedHadiths;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/app_logo.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: hadethList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: hadethList.length,
        itemBuilder: (context, index) {
          final hadith = hadethList[index];
          return ListTile(
            title: Text(
              hadith.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white, // ✅ Changed to white
              ),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HadethDetails(hadeth: hadith),
                ),
              );
            },
          );
        },
        separatorBuilder: (_, __) => const Divider(
          color: Colors.white, // ✅ Divider also white
        ),
      ),
    );
  }
}
