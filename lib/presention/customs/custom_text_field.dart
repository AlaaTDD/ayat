import 'package:ayat/presention/resorces/color_app.dart';
import 'package:flutter/material.dart';

import '../resorces/size_app.dart';

class CustomTextFormFeld extends StatefulWidget {
  final String? hinttext;
  final IconData? icon, suficon;
  final Function? onChange;
  final Widget? child;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final TextDirection? textDirection;
  const CustomTextFormFeld({
    Key? key,
    this.hinttext,
    this.icon,
    this.suficon,
    this.controller,
    this.child,
    required this.textInputType,
    this.onChange,
    this.textDirection,
  }) : super(key: key);
  @override
  _CustomTextFormFeldState createState() => _CustomTextFormFeldState();
}

class _CustomTextFormFeldState extends State<CustomTextFormFeld> {
  bool cc = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:  getResponsiveFontSize(context,iphoneSize: 390,ipadMediumSize: 600,ipadLargeSize: 600),
      child: TextFormField(
        onChanged: (value) => widget.onChange?.call(value),
        obscureText: ["كلمة المرور", "تأكيد كلمة المرور","كلمة المرور الحساب"].contains(widget.hinttext) && cc,
        controller: widget.controller,
        maxLines:["كلمة المرور", "تأكيد كلمة المرور","كلمة المرور الحساب"].contains(widget.hinttext) ? 1 : null,
        textDirection: widget.textDirection,
        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16, fontWeight: FontWeight.w600),
        cursorColor: Theme.of(context).primaryColor,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          isDense: true,
          hintText: widget.hinttext,
          hintStyle: TextStyle(color: Theme.of(context).primaryColor.withOpacity(0.3), fontSize: 11, fontWeight: FontWeight.bold),
          prefixIcon: Icon(widget.icon, color: Theme.of(context).primaryColor.withOpacity(0.3), size: 15),
          icon: ["مكان وسنة الولاده"].contains(widget.hinttext)?widget.child:null,
          enabledBorder: _borderStyle(),
          focusedBorder: _borderStyle(),
          border: _borderStyle(),
        ),
      ),
    );
  }

  OutlineInputBorder _borderStyle() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1),
      borderRadius: BorderRadius.circular(15),
    );
  }
}
