import 'package:flutter/material.dart';
import '../presention/resorces/color_app.dart';
import '../presention/resorces/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quran Karem',
      debugShowCheckedModeBanner: false,
      theme:  ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
        scaffoldBackgroundColor: ColorManager.whiteColor,
        shadowColor: ColorManager.grayColor,
        appBarTheme: const AppBarTheme(
            backgroundColor: ColorManager.whiteColor,
            foregroundColor: ColorManager.appbarColor,
            scrolledUnderElevation: 0,
            elevation: 0),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: ColorManager.whiteColor,
        ),
      ),
      themeMode: ThemeMode.light,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
    );
  }
}
