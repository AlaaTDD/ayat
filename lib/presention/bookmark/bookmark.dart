import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/bloc/quarn/quarn_cubit.dart';
import '../customs/appbar_custom.dart';
import '../customs/custom_text.dart';
import '../resorces/color_app.dart';
import '../resorces/size_app.dart';

class Bookmark extends StatelessWidget {
  const Bookmark({super.key});
  @override
  Widget build(BuildContext context) {
   return  BlocProvider(
     create: (_)=>QuarnCubit()..GetAyasaved(),
     child: BlocBuilder<QuarnCubit, QuarnState>(
        builder: (context, state) {
          String nameAYA = QuarnCubit.get(context).nameAYA;

          return Scaffold(
            appBar: appBarCustom(context, "العلامة"),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    if (nameAYA == 'لا توجد آيات محفوظة') ...[
                      CustomText(
                        name: nameAYA,
                        fontWeight: FontWeight.w300,
                        font: getResponsiveFontSize(context,iphoneSize: 13,ipadMediumSize: 16,ipadLargeSize: 18) ,
                        alignmentGeometry: Alignment.center,
                        maxLines: 16,
                      ),
                    ] else if (nameAYA.contains('\n\n')) ...[
                      CustomText(
                        name: nameAYA.split('\n\n')[0],
                        fontWeight: FontWeight.bold,
                        font: getResponsiveFontSize(context,iphoneSize: 18,ipadMediumSize: 22,ipadLargeSize: 24) ,
                        fontFa: "",
                        alignmentGeometry: Alignment.center,
                        maxLines: 16,
                      ),
                      const SizedBox(height: 20),
                      CustomText(
                        name: nameAYA.split('\n\n')[1],
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.bold,
                        font: getResponsiveFontSize(context,iphoneSize: 18,ipadMediumSize: 22,ipadLargeSize: 24) ,
                        fontFa: "",
                        alignmentGeometry: Alignment.center,
                        maxLines: 16,
                      ),
                    ] else ...[
                      CustomText(
                        name: nameAYA,
                        fontWeight: FontWeight.bold,
                        font: getResponsiveFontSize(context,iphoneSize: 18,ipadMediumSize: 22,ipadLargeSize: 24) ,
                        fontFa: "",
                        alignmentGeometry: Alignment.center,
                        maxLines: 16,
                      ),
                    ]
                  ],
                ),
              ),
            ),
          );
        },
      ),
   );

  }
}
