import 'package:ayat/data/bloc/aya/aya_cubit.dart';
import 'package:ayat/presention/customs/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../resorces/size_app.dart';

class CustomDropMenu extends StatelessWidget {
  const CustomDropMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AyaCubit, AyaState>(
        builder: (BuildContext context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: getResponsiveFontSize(context,iphoneSize: 55,ipadMediumSize: 65,ipadLargeSize: 75),
              height: 50,
              child: DropdownButton<double>(
                value:
                    AyaCubit.get(context).sizeFont, // Assume this is of type double
                isExpanded: true,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                iconSize: getResponsiveFontSize(context,iphoneSize: 24,ipadMediumSize: 30,ipadLargeSize: 35),
                elevation: 16,

                style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                underline: Container(
                  height: 2,
                  color: Colors.transparent,
                ),
                onChanged: (double? newValue) {
                  AyaCubit.get(context).changeSizeFont(newValue!);
                },
                items: List.generate(30,
                        (index) => (index + 1) * 1.0) // Generating double values
                    .map<DropdownMenuItem<double>>((double value) {
                  return DropdownMenuItem<double>(
                    value: value,
                    child: CustomText(
                      name: value.toString(),
                      fontWeight: FontWeight.w600,
                      font: getResponsiveFontSize(context,iphoneSize: 12,ipadMediumSize: 14,ipadLargeSize: 16),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      }
    );
  }
}
