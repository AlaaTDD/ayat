import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/bloc/darkmode/darkmode_cubit.dart';
import '../presention/resorces/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DarkmodeCubit(),
      child: BlocBuilder<DarkmodeCubit, DarkmodeState>(
        builder: (context, state) {
          bool isDarkMode = false;
          if (state is DarkmodeInitial) {
            isDarkMode = state.isDarkMode;
          }
          return MaterialApp(
            title: 'Quran Karem',
            debugShowCheckedModeBanner: false,
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
            theme: DarkmodeCubit.get(context).lightTheme,
            darkTheme: DarkmodeCubit.get(context).darkTheme,
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: Routes.splashRoute,
          );
        },
      ),
    );
  }
}
