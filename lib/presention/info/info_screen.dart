import 'package:flutter/material.dart';
import '../../models/info_model.dart';
import '../customs/appbar_custom.dart';
import '../resorces/size_app.dart';
import '../resorces/string_manager.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(context, AppStrings.info),
      body: Padding(
        padding:  EdgeInsets.all(SizeApp.padingapp),
        child: Center(
          child: SizedBox(
            width: SizeApp.widthapp,
            child: ListView.builder(
              itemCount: infos.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RichText(
                          textDirection: TextDirection.rtl,
                          text: TextSpan(children: [
                            TextSpan(
                                text: " (${(index+1).toString()}) ",
                                style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor)),
                            TextSpan(
                                text: "${infos[index]["text"]}\n",
                                style: TextStyle(fontSize: 16,color: Theme.of(context).primaryColor)),
                          ])),
                      infos[index]["image"]=="NA"?Container():   Container(
                       clipBehavior: Clip.antiAliasWithSaveLayer,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(15)
                         ),
                         child: Image.asset(infos[index]["image"]))

                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
