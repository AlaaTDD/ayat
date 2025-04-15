import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/bloc/quarn/quarn_cubit.dart';
import '../customs/mediaquery.dart';
import '../resorces/color_app.dart';
import '../resorces/size_app.dart';

class AyaOfDay extends StatelessWidget {
  const AyaOfDay({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=>QuarnCubit()..getRandomAyah(),
      child:BlocBuilder<QuarnCubit,QuarnState>(
        builder: (context, state) {
          return  Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: width(context),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              decoration: BoxDecoration(
                color:Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${QuarnCubit.get(context).surahName}",
                      style: TextStyle(
                        fontSize: getResponsiveFontSize(context,iphoneSize: 20,ipadMediumSize: 30,ipadLargeSize: 40),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      QuarnCubit.get(context).ayah,
                      style: TextStyle(
                        fontSize: getResponsiveFontSize(context,iphoneSize: 20,ipadMediumSize: 27,ipadLargeSize: 29),

                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        },),
    );
  }
}
