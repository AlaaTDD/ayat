part of 'darkmode_cubit.dart';

@immutable
sealed class DarkmodeState {}

final class DarkmodeInitial extends DarkmodeState {
  final bool isDarkMode;

  DarkmodeInitial({required this.isDarkMode});
}
