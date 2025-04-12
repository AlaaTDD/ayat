import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/bloc/aya/aya_cubit.dart';
import '../resorces/color_app.dart';
import 'custom_text.dart';


class NeedBloc{
  static  showshowSnackBar(String msg) =>
      Fluttertoast.showToast(
          msg: msg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.teal,
          textColor: Colors.white,
          fontSize: 16.0
      );

  static showDialogColor(BuildContext context) {
    final ayaCubit = AyaCubit.get(context);
    return showDialog(
      context: context,
      useSafeArea: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: CustomText(name: 'اختيار اللون', fontWeight: FontWeight.w600, font: 18),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleColorPicker(
                onChanged: (color) {
                  String hexColor = '${color.value.toRadixString(16).toUpperCase()}';
                  ayaCubit.ChangeColor(hexColor);
                },
                size: const Size(240, 240),
                strokeWidth: 4,
                thumbSize: 36,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog without saving
              },
              child: CustomText(name: 'غلق', fontWeight: FontWeight.w600, font: 14,color: ColorManager.redColor,),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Confirm and close the dialog
                // Optionally: Trigger any final color save action here
              },
              child:CustomText(name: 'تأكيد', fontWeight: FontWeight.w600, font: 14),
            ),
          ],
        );
      },
    );
  }


}