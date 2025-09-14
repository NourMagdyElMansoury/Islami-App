import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:islami/core/excisions%20/excisions.dart';
import 'package:islami/core/excisions/excisions.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/models/sura.dart';

class SuraDetails extends StatefulWidget {
  static const String route = 'suraDetails';

  final Sura sura;
  const SuraDetails({super.key, required this.sura});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  String suraDetails = '';
  List<String> ayat = [];

  @override
  void initState() {
    super.initState();
    readSura(widget.sura.id);
  }

  @override
  Widget build(BuildContext context) {
    var sura = widget.sura;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: AppColor.secondaryColor),
        ),
        title: Text(sura.suraNameEn),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/sura.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: suraDetails.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/sura.jpg', height: 40),
                Text(
                  sura.suraNameAr,
                  style: context.appTextTheme.bodyLarge,
                ),
                Image.asset('assets/images/sura.jpg', height: 40),
              ],
            ),
            const SizedBox(height: 16),

            // ✅ Show all ayat
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (int i = 0; i < ayat.length; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Text(
                          "${ayat[i]}  ﴿${i + 1}﴾",
                          style: context.appTextTheme.labelLarge!.copyWith(
                            color: context.appTheme.colorScheme.secondary,
                            height: 1.8,
                          ),
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void readSura(int id) async {
    try {
      final data = await rootBundle.loadString('assets/suras/$id.txt');
      setState(() {
        suraDetails = data;
        ayat = data.trim().split('\n');
      });
    } catch (e) {
      debugPrint("❌ Error reading sura file: $e");
    }
  }
}
