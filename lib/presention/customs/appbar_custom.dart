import 'package:ayat/presention/resorces/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:ayat/presention/customs/rive_menu_button.dart';
import '../resorces/size_app.dart';
import 'custom_text.dart';

AppBar appBarCustom(BuildContext context, String name) {
  return AppBar(
    toolbarHeight: getResponsiveFontSize(context,iphoneSize: 60,ipadMediumSize: 80,ipadLargeSize: 80),

    leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios_outlined,
        )),
    centerTitle: true,
    title: CustomText(
      name: name,
      fontWeight: FontWeight.bold,
      font: getResponsiveFontSize(context,iphoneSize: 20,ipadMediumSize: 28,ipadLargeSize: 30),
    ),
  );
}
AppBar appBarSurah(BuildContext context, String name) {
  return AppBar(
    toolbarHeight: getResponsiveFontSize(context,iphoneSize: 60,ipadMediumSize: 80,ipadLargeSize: 80),

    leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios_outlined,
        )),
    centerTitle: true,
    actions: [
      IconButton(onPressed: (){
        Navigator.pushNamed(context, Routes.infoRoute);

      }, icon: Icon(Icons.info_outline)),
      IconButton(onPressed: (){
        Navigator.pushNamed(context, Routes.markRoute);
      }, icon: Icon(Icons.bookmark)),
    ],
    title: CustomText(
      name: name,
      fontWeight: FontWeight.bold,
      font: getResponsiveFontSize(context,iphoneSize: 20,ipadMediumSize: 28,ipadLargeSize: 30),
    ),
  );
}
AppBar appBarHome(BuildContext context, String name) {
  return AppBar(
    leading: Center(
      child: CircleAvatar(
         radius: getResponsiveFontSize(context,iphoneSize: 25,ipadMediumSize: 30,ipadLargeSize: 35),
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage("assets/images/logoinside.png")),
    ),
    centerTitle: false,
    toolbarHeight: getResponsiveFontSize(context,iphoneSize: 60,ipadMediumSize: 80,ipadLargeSize: 80),
    actions: [
      RiveMenuButton()
    ],
    title: CustomText(
      name: name,
      fontWeight: FontWeight.bold,
      fontFa: "Cairo",
      font: getResponsiveFontSize(context,iphoneSize: 20,ipadMediumSize: 28,ipadLargeSize: 30),
    ),
  );
}



