import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'page_state.dart';

class PageCubit extends Cubit<int> {

  PageCubit() : super(0);

  static PageCubit get(BuildContext context) => BlocProvider.of(context);

  void changePage(int index) {
    emit(index);
  }
}