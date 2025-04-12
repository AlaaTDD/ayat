part of 'aya_cubit.dart';

@immutable
abstract class AyaState {}

class AyaInitial extends AyaState {}
class ayaSaved extends AyaState {}
class ChangeFont extends AyaState {}
class changeColor extends AyaState {}
class getSavedEdit extends AyaState {}