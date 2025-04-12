import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../presention/resorces/color_app.dart';
part 'darkmode_state.dart';

class DarkmodeCubit extends Cubit<DarkmodeState> {
  DarkmodeCubit() : super(DarkmodeInitial(isDarkMode: false)) {
    _loadTheme();
  }

  static DarkmodeCubit get(context) => BlocProvider.of(context);

  Future<void> _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
    emit(DarkmodeInitial(isDarkMode: isDarkMode));
  }

  Future<void> toggleTheme() async {
    if (state is DarkmodeInitial) {
      bool isDarkMode = !(state as DarkmodeInitial).isDarkMode;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isDarkMode', isDarkMode);
      emit(DarkmodeInitial(isDarkMode: isDarkMode));
    }
  }

  ThemeData lightTheme = ThemeData(
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
  );

  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    shadowColor: ColorManager.mainColor,
    scaffoldBackgroundColor: ColorManager.appbarColor,
    appBarTheme: const AppBarTheme(
        backgroundColor: ColorManager.appbarColor,
        foregroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: ColorManager.appbarColor,
    ),
  );
}
