import 'package:flutter/material.dart';
import 'package:ayat/presention/customs/appbar_custom.dart';

import '../resorces/string_manager.dart';
import 'aya_of_day.dart';
import 'banner_quran.dart';
import 'main_list_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBody: true,
        
        appBar: appBarHome(context, AppStrings.nameAppAyat),
        body: ListView(
          children: [
            BannerQuran(),
            AyaOfDay(),
            MainListHome()
          ],
        ),
      ),
    );
  }
}





