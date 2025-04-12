part of 'spha_cubit.dart';

@immutable
sealed class SphaState {}

final class SphaInitial extends SphaState {}

class success extends SphaState {}
