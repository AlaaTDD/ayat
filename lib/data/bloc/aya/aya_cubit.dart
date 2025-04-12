import 'package:ayat/presention/customs/need_bloc.dart';
import 'package:ayat/presention/customs/share_per.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'aya_state.dart';

class AyaCubit extends Cubit<AyaState> {
  AyaCubit() : super(AyaInitial());
  static AyaCubit get(context) => BlocProvider.of(context);

String aya="";
 GetAyaSaved()async{
    aya=await SharePer.getData("aya");
    emit(ayaSaved());
  }

  void copyToClipboard(BuildContext context, String text)async {
    await SharePer.saveData("aya", text);
    NeedBloc.showshowSnackBar("تم أضافة العلامه");
    GetAyaSaved();
  }
 double sizeFont=20.0;
 changeSizeFont(double sizeFont){
   this.sizeFont=sizeFont;
   emit(ChangeFont());
 }
 String color="eb4034";
 ChangeColor(String color){
   this.color=color;
   emit(changeColor());
 }
 getEditQuran()async{
   String font=await SharePer.getData("font");
  String colorV=  await SharePer.getData("color");
   if(font!="NA"){
     sizeFont=double.parse(font);
   }
   if(colorV!="NA"){
     color=colorV;
   }
   emit(getSavedEdit());
 }
 SaveEditQuran(){
   SharePer.saveData("font", sizeFont.toString());
   SharePer.saveData("color", color.toString());
   NeedBloc.showshowSnackBar("تم الحفظ");
 }
}
