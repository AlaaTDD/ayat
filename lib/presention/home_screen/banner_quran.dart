import 'package:flutter/material.dart';
import '../customs/custom_text.dart';
import '../resorces/color_app.dart';
import '../resorces/routes_manager.dart';
import '../resorces/size_app.dart';
import '../resorces/string_manager.dart';

class BannerQuran extends StatelessWidget {
  const BannerQuran({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.surahRoute);
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image:const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/banner.jpeg")),
              color: Colors.transparent),
          child: CustomText(
              name: AppStrings.nameApp,
              fontFa: "NotoNastaliqUrdu",
              alignmentGeometry: Alignment.center,
              fontWeight: FontWeight.w900,
              font: getResponsiveFontSize(context,iphoneSize: 30,ipadMediumSize: 45,ipadLargeSize: 55),
              width: 100,
              color: ColorManager.whiteColor),
        ),
      ),
    );
  }
}
