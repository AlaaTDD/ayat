import 'package:flutter/material.dart';
import '../../models/update_model.dart';
import '../customs/appbar_custom.dart';
import '../resorces/size_app.dart';
import '../resorces/string_manager.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(context, AppStrings.update),
      body: Padding(
        padding:  EdgeInsets.all(SizeApp.padingapp),
        child: ListView.builder(
          itemCount: updates.length,
          itemBuilder: (BuildContext context, int index) {
            return RichText(
              textDirection: TextDirection.rtl,
                text: TextSpan(children: [
                  TextSpan(
                      text: " (${(index+1).toString()}) ",
                      style: TextStyle(fontSize: 16,color: Theme.of(context).primaryColor)),
              TextSpan(
                  text: "${updates[index]}\n",
                  style: TextStyle(fontSize: 16,color: Theme.of(context).primaryColor)),
            ]));
          },
        ),
      ),
    );
  }
}
