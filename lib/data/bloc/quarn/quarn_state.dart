part of 'quarn_cubit.dart';

@immutable
sealed class QuarnState {}

final class QuarnInitial extends QuarnState {}
class successGetAya extends QuarnState {}
class successGetAyaSaved extends QuarnState {}