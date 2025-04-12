import 'package:clipboard/clipboard.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/bloc/aya/aya_cubit.dart';
import '../../models/model_surah.dart';
import '../customs/appbar_custom.dart';
import '../customs/custom_text.dart';
import '../customs/need_bloc.dart';
import '../resorces/size_app.dart';
import '../resorces/string_manager.dart';
import 'package:quran/quran.dart' as quran;

class AyatDetails extends StatelessWidget {
  final Chapter chapter;
  AyatDetails({required this.chapter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSurah(
        context, quran.getSurahNameArabic(chapter.id),),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: BlocProvider(
                create:
                    (_) =>
                AyaCubit()
                  ..GetAyaSaved()
                  ..getEditQuran(),
                child: BlocBuilder<AyaCubit, AyaState>(
                  builder: (BuildContext context, state) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeApp.padingapp,
                        ),
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            if (chapter.id != 9 && chapter.id != 1)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15.0,
                                ),
                                child: CustomText(
                                  name: quran.basmala,
                                  alignmentGeometry: Alignment.center,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  font: AyaCubit.get(context).sizeFont,
                                  fontFa: AppStrings.fontFamily,
                                ),
                              ),
                            RichText(
                              textAlign:chapter.versesCount <= 20
                                  ? TextAlign.center
                                  : TextAlign.justify,
                              text: TextSpan(
                                children: [
                                  for (var i = 0; i <chapter.versesCount; i++) ...{
                                    TextSpan(
                                      text:
                                      ' ${quran.getVerse(chapter.id, i + 1, verseEndSymbol: false)} ',
                                      recognizer:
                                      TapGestureRecognizer()
                                        ..onTap = () {
                                          FlutterClipboard.copy(
                                            '${quran.getVerse(chapter.id, i + 1, verseEndSymbol: true)}',
                                          ).then((val) {
                                            NeedBloc.showshowSnackBar(
                                              AppStrings.copy,
                                            );
                                          });
                                        },
                                      style: TextStyle(
                                        fontFamily: AppStrings.fontFamily,
                                        fontSize:
                                        AyaCubit.get(context).sizeFont,
                                        fontWeight: FontWeight.w800,
                                        backgroundColor:
                                        '${quran.getSurahNameArabic(chapter.id)}\n\n${ quran.getVerse(int.parse(chapter.id.toString()), i + 1, verseEndSymbol: false,)} (${replaceFarsiNumber((i + 1).toString())})' ==
                                            AyaCubit.get(context).aya
                                            ? Color(
                                          int.parse(
                                            "0xff${AyaCubit.get(context).color}",
                                          ),
                                        ).withOpacity(0.4)
                                            : Colors.transparent,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' {${i + 1}} ',
                                      recognizer:
                                      TapGestureRecognizer()
                                        ..onTap = () {

                                          String aya='${quran.getSurahNameArabic(chapter.id)}\n\n${ quran.getVerse(int.parse(chapter.id.toString()), i + 1, verseEndSymbol: false,)} (${replaceFarsiNumber((i + 1).toString())})';
                                          AyaCubit.get(context).copyToClipboard(context,aya);
                                        },
                                      style: TextStyle(
                                        fontFamily: AppStrings.fontFamily,
                                        fontSize:
                                        AyaCubit.get(context).sizeFont,
                                        backgroundColor:
                                        '${quran.getSurahNameArabic(chapter.id)}\n\n${ quran.getVerse(int.parse(chapter.id.toString()), i + 1, verseEndSymbol: false,)} (${replaceFarsiNumber((i + 1).toString())})'==
                                            AyaCubit.get(context).aya
                                            ? Color(
                                          int.parse(
                                            "0xff${AyaCubit.get(context).color}",
                                          ),
                                        ).withOpacity(0.4)
                                            : Colors.transparent,
                                        color:Theme.of(
                                          context,
                                        ).primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  },
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  String replaceFarsiNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['۰', '۱', '۲', '۳', '٤', '۵', '٦', '۷', '۸', '۹'];
    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], farsi[i]);
    }
    return input;
  }
}


