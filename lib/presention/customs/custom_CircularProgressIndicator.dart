import 'package:flutter/material.dart';

import '../resorces/color_app.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: 30,
        width: 30,
        child: CircularProgressIndicator(
          color: ColorManager.redColor,
        ),
      ),
    );
  }
}


class CustomLinearProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return  Padding(
      padding: const EdgeInsets.only(top: 60.0),
      child: LinearProgressIndicator(
        backgroundColor:ColorManager.whiteColor ,
        color: ColorManager.redColor,
      ),
    );
  }
}