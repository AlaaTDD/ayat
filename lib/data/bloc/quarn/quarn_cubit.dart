import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:ayat/presention/customs/need_bloc.dart';
import 'package:quran/quran.dart' as quran;

import '../../../presention/customs/share_per.dart';

part 'quarn_state.dart';

class QuarnCubit extends Cubit<QuarnState> {
  String surahName = "";
  String ayah = "";
  QuarnCubit() : super(QuarnInitial());
  static QuarnCubit get(context)=>BlocProvider.of(context);
  void getRandomAyah() {
    int totalSurahs = 114;
    int randomSurah = Random().nextInt(totalSurahs) + 1;
    int totalVersesInSurah = quran.getVerseCount(randomSurah);
    int randomVerse = Random().nextInt(totalVersesInSurah) + 1;
    surahName = quran.getSurahNameArabic(randomSurah);
    ayah = "${quran.getVerse(randomSurah, randomVerse, verseEndSymbol: false)} \uFD3F$randomVerse\uFD3E";
  emit(successGetAya());
  }
  String nameAYA='';

 GetAyasaved()async{
   String name=await SharePer.getData("aya");
  if(name!='NA'){
    nameAYA=name;
  }else{
    nameAYA="لا توجد آيات محفوظة";
  }
  emit(successGetAyaSaved());
 }
  void copyToClipboard(BuildContext context, String text)async {
    Clipboard.setData(ClipboardData(text: text));
    await SharePer.saveData("aya", text);
    NeedBloc.showshowSnackBar("تم نسخ");
    GetAyasaved();
  }
}
