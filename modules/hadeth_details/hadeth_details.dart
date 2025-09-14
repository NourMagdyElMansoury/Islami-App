import 'package:flutter/material.dart';
import 'package:islami/models/hadeth.dart';

class HadethDetails extends StatelessWidget {
  final Hadeth hadeth;

  const HadethDetails({super.key, required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hadeth.title),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/app_logo.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Text(
            hadeth.content,
            style: const TextStyle(
              fontSize: 18,
              height: 1.8,
            ),
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          ),
        ),
      ),
    );
  }
}
