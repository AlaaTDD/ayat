import 'package:flutter/material.dart';
import 'package:ayat/presention/home_screen/home_screen.dart';
import '../../models/model_surah.dart';
import '../azkar/azkarMasaa.dart';
import '../azkar/azkarSapaz.dart';
import '../bookmark/bookmark.dart';
import '../info/info_screen.dart';
import '../quran/quran_screen.dart';
import '../quran/surah_detail.dart';
import '../setting/setting_screen.dart';
import '../spha_screen/spha_screen.dart';
import '../splash_screen/splash_screen.dart';
import '../update/update_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String homeRoute = "/home";
  static const String surahRoute = "/surah";
  static const String detailsRoute = "/details";
  static const String sphaRoute = "/spha";
  static const String updateRoute = "/update";
  static const String infoRoute = "/info";
  static const String settingRoute = "/setting";
  static const String azkamassRoute = "/azkamass";
  static const String azkaspahRoute = "/azkaspah";
  static const String markRoute = "/mark";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return _createRoute(const SplashScreen());
      case Routes.homeRoute:
        return _createRoute(const HomeScreen());
      case Routes.surahRoute:
        return _createRoute( QuranScreen());
      case Routes.detailsRoute:
        return _createRoute( AyatDetails(chapter:settings.arguments as Chapter ,));
      case Routes.sphaRoute:
        return _createRoute(const SphaScreen());
      case Routes.infoRoute:
        return _createRoute(const InfoScreen());
      case Routes.updateRoute:
        return _createRoute(const UpdateScreen());
      case Routes.settingRoute:
        return _createRoute(const SettingScreen());
      case Routes.azkaspahRoute:
        return _createRoute(const AzkaSapaz());
      case Routes.azkamassRoute:
        return _createRoute(const AzarMasa());
      case Routes.markRoute:
        return _createRoute(const Bookmark());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text("Not Found"),
        ),
        body: const Center(child: Text("Page Not Found")),
      ),
    );
  }
}
