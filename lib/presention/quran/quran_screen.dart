import 'package:ayat/presention/customs/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:ayat/presention/customs/appbar_custom.dart';
import 'package:ayat/presention/customs/custom_text.dart';
import 'package:ayat/presention/resorces/routes_manager.dart';
import 'package:quran/quran.dart' as quran;

import '../../models/model_surah.dart';

class QuranScreen extends StatefulWidget {
  QuranScreen({Key? key}) : super(key: key);
  @override
  State<QuranScreen> createState() => _QuranScreenState();
}
class _QuranScreenState extends State<QuranScreen> {
  TextEditingController searchController = TextEditingController();
  List<int> filteredSurahs = List.generate(114, (index) => index + 1);
  void filterSurahs(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredSurahs = List.generate(114, (index) => index + 1);
      } else {
        filteredSurahs =
            List.generate(114, (index) => index + 1)
                .where(
                  (index) =>
                      quran.getSurahNameArabic(index).contains(query.trim()) ||
                      quran
                          .getSurahNameEnglish(index)
                          .toLowerCase()
                          .contains(query.trim().toLowerCase()),
                )
                .toList();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(context, "السور"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: CustomTextFormFeld(
                textInputType: TextInputType.text,
                controller: searchController,
                hinttext: 'ابحث باسم السورة',
                icon: Icons.search,
                onChange: filterSurahs,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredSurahs.length,
              itemBuilder: (context, index) {
                int surahIndex = filteredSurahs[index];
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListTile(
                    onTap: () {
                    Chapter chapter=Chapter(id: index+1, versesCount: quran.getVerseCount(index+1));
                    Navigator.pushNamed(context, Routes.detailsRoute,arguments:chapter );
                    },
                    leading: Icon(Icons.bookmark),
                    trailing: Text(quran.getVerseCount(surahIndex).toString()),
                    subtitle: CustomText(
                      name: quran.getSurahNameEnglish(surahIndex),
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      font: 15,
                    ),
                    title: CustomText(
                      name: quran.getSurahNameArabic(surahIndex),
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      font: 15,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
