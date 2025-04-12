import 'package:ayat/presention/customs/custom_drop_menu.dart';
import 'package:ayat/presention/customs/custom_outlinebottom.dart';
import 'package:ayat/presention/customs/custom_text.dart';
import 'package:ayat/presention/resorces/size_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/bloc/aya/aya_cubit.dart';
import '../customs/appbar_custom.dart';
import '../customs/need_bloc.dart';
import '../resorces/string_manager.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(context, AppStrings.setting),
      body: BlocProvider(
        create: (context) => AyaCubit()..getEditQuran(),
        child: BlocBuilder<AyaCubit, AyaState>(
          builder: (BuildContext context, state) {
            return Padding(
              padding:  EdgeInsets.all(SizeApp.padingapp),
              child: SizedBox(
                width: SizeApp.widthapp,
                child: ListView(
                  children: [
                    CustomText(name: AppStrings.settingQuran,alignmentGeometry: Alignment.centerRight, fontWeight: FontWeight.w600, font: 16),
                    const SizedBox(height: 20,),
                    titleW(const CustomDropMenu(),AppStrings.fontQuran, Icons.font_download_outlined,context),
                    titleW( Padding(
                      padding: const EdgeInsets.only(right: 35.0),
                      child: IconButton(onPressed: (){
                      NeedBloc.showDialogColor(context);
                      }, icon:const Icon(Icons.color_lens_outlined)),
                    ),AppStrings.colorQuran, Icons.color_lens_outlined,context),
                    CustomOutLineWithIcon(name: AppStrings.saveSetting, iconData: Icons.done_outline_rounded, onPressed: (){
                     AyaCubit.get(context).SaveEditQuran();
                    }, color: Theme.of(context).primaryColor,colorr: Theme.of(context).shadowColor,),

                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  Widget titleW(Widget widget, String name, IconData icondata,BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin:const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).shadowColor,
          borderRadius: BorderRadius.circular(15)
        ),
        child: ListTile(
          contentPadding:const EdgeInsets.symmetric(vertical: 0,horizontal: 8),
          trailing: SizedBox(
            width: 100,  // Adjust the width as needed
            child: widget,
          ),
          title: CustomText(name: name,alignmentGeometry: Alignment.centerRight, fontWeight: FontWeight.w600, font: 14),
          leading: Icon(icondata),
        ),
      ),
    );
  }
}
