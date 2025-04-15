import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ayat/data/bloc/spha/spha_cubit.dart';
import 'package:ayat/presention/customs/mediaquery.dart';
import 'package:rive/rive.dart' as rive;
import '../customs/appbar_custom.dart';
import '../customs/custom_text.dart';
import '../resorces/size_app.dart';


class SphaScreen extends StatefulWidget {
  const SphaScreen({super.key});
  @override
  State<SphaScreen> createState() => _SphaScreenState();
}

class _SphaScreenState extends State<SphaScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: BlocProvider(
        create: (_) => SphaCubit()..loadRiveFile(),
        child: BlocBuilder<SphaCubit, SphaState>(
          builder: (BuildContext context, state) {
            return Scaffold(
              appBar: appBarCustom(context, ""),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.teal,
                onPressed: SphaCubit.get(context).fireTrigger,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/images/spha.png", color: Colors.white),
                ),
              ),
              body: Center(
                child: Stack(
                  children: [

                    Center(
                      child: SphaCubit.get(context).artboardf != null
                          ? rive.Rive(
                        artboard: SphaCubit.get(context).artboardf!,
                        fit: BoxFit.fill,
                      )
                          : Container(),
                    ),
                    // Positioned(
                    //   left: 0,
                    //   child: Container(
                    //     height: height(context),
                    //     width: 150,
                    //     color: Theme.of(context).scaffoldBackgroundColor,
                    //   ),
                    // ),
                    // Positioned(
                    //   right: 0,
                    //   child: Container(
                    //     height: height(context),
                    //     width: 150,
                    //     color: Theme.of(context).scaffoldBackgroundColor,
                    //   ),
                    // ),
                    SizedBox(
                      width: width(context),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(name: text(SphaCubit.get(context).i),
                            fontWeight: FontWeight.w900,
                            font:getResponsiveFontSize(context,iphoneSize: 30,ipadMediumSize: 35,ipadLargeSize: 40),
                          ),
                          CustomText(name: SphaCubit.get(context).i.toString(),
                              fontWeight: FontWeight.w900,
                            font:getResponsiveFontSize(context,iphoneSize: 25,ipadMediumSize: 30,ipadLargeSize: 35),
                          ),
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
    );
  }

  String text(int i) {
    if (i <= 33) {
      return "سبحان الله";
    } else if (i <= 66 && i > 33) {
      return "الحمد الله";
    } else if (i <= 99 && i > 66) {
      return "الله اكبر";
    } else {
      return "";
    }
  }
}

