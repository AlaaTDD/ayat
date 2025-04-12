import 'package:ayat/presention/resorces/color_app.dart';
import 'package:flutter/material.dart';

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
      width: 390,
      child: TextFormField(
        onChanged: (value) => widget.onChange?.call(value),
        validator: (val) {
          if (val == null || val.isEmpty) {
            switch (widget.hinttext) {
              case "البريد الإلكتروني":
                return "ادخل البريد الإلكتروني";
              case "كلمة المرور":
              case "تأكيد كلمة المرور":
              case "كلمة المرور الحساب":
              case "تأكيد كلمة المرور":
                return "ادخل ست احرف علي الاقل";
              case "الاسم الأول":
                return "ادخل الاسم الاول";
              case "الاسم الأخير":
                return "ادخل الاسم الاخير";
              case "العنوان":
                return "ادخل العنوان";
              case "مكان وسنة الولاده":
                return "ادخل مكان وسنة الولاده";
              case "رقم الهوية":
                return "ادخل رقم الهوية";
              case "المهنة":
                return "ادخل المهنة";
              case "اضف فرق العمله":
                return "ادخل فرق العمله";
              case "تغيير كلمة المرور":
                return "ادخل كلمة المرور";
              case "أبحث عن المستخدم برقم الهوية":
                return "ادخل رقم الهوية المستخدم";
              case "أضف مبلغ":
                return "أضف مبلغ";
              case "اللينك":
                return "أضف اللينك";
              case "اسم الزر":
                return "أضف اسم الزر";
              case "الاسم":
                return "أضف الاسم";
              case "تفاصيل الخدمه":
                return "أضف تفاصيل الخدمه";
              case "رقم الهاتف":
                return "أضف رقم الهاتف";
              default:
                return null;
            }
          }
          return null;
        },
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
          suffixIcon:["كلمة المرور", "تأكيد كلمة المرور","كلمة المرور الحساب"].contains(widget.hinttext)
              ? InkWell(
              onTap: () => setState(() => cc = !cc),
              child: Icon(widget.suficon, size: 17, color: Theme.of(context).primaryColor.withOpacity(0.3)))
              : null,

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
// else if(!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(val)) {
// return "البريد الالكتروني غير صالح";
// }



class CustomTextFormFeldpay extends StatefulWidget {
  final String? hinttext;
  final GestureTapCallback? callback;
  final String? label;
  final IconData? icon;
  final IconData? suficon;
  final Function? onChange;
  final GestureTapCallback ? onClick;
  final GestureTapCallback ? cha;
  final Color ? color;

  final TextEditingController? controller;
  final TextInputType textInputType;
  final TextDirection? textDirection;

  CustomTextFormFeldpay({Key? key, this.hinttext,this.label,
    this.callback,
    this.icon, this.suficon, this.onClick, this.cha,this.color,
    this.controller,
    required this.textInputType,
    this.onChange, this.textDirection,

  }) : super(key: key);

  @override
  _CustomTextFormFeldpayState createState() => _CustomTextFormFeldpayState();
}
class _CustomTextFormFeldpayState extends State<CustomTextFormFeldpay> {
  bool cc = true;
  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: 370,
        child: TextFormField(
          onChanged: (value) =>widget.onChange!(value),
          validator: ( val)
          {
            if(val!.isEmpty&&widget.hinttext=="البريد الالكتروني")
            {
              return "ادخل البريد الالكتروني";
            }else if(val.length<6&&val.isEmpty&&widget.hinttext=="كلمة المرور")
            {
              return "ادخل ست احرف علي الاقل";
            }else if(val.length<6&&val.isEmpty&&widget.hinttext=="تأكيد كلمة المرور")
            {
              return "ادخل ست احرف علي الاقل";
            }

          },
          obscureText: (widget.hinttext=="كلمة المرور"&&cc) ||(widget.hinttext=="تأكيد كلمة المرور"&&cc)?true:false ,
          controller: widget.controller,
          maxLines:widget.hinttext=="كلمة المرور"||widget.hinttext=="تأكيد كلمة المرور"?1:null,
          textDirection: widget.textDirection,
          style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 16,fontWeight: FontWeight.w600),
          cursorColor: Theme.of(context).primaryColor,
          keyboardType: widget.textInputType,
          enabled: true,
          readOnly: ['الرسوم'].contains(widget.hinttext)?true:false,
          decoration: InputDecoration(
            isDense: true,
            hintText: widget.hinttext,
            labelText: widget.label,
            labelStyle:  TextStyle(color: ColorManager.greenColor,fontSize: 12,fontWeight: FontWeight.bold),
            hintStyle:  TextStyle(color: Theme.of(context).primaryColor.withOpacity(0.3),fontSize: 12,fontWeight: FontWeight.bold),
            suffixIcon:["كلمة المرور", "تأكيد كلمة المرور","كلمة المرور الحساب"].contains(widget.hinttext)
                ? InkWell(
                onTap: () => setState(() => cc = !cc),
                child: Icon(widget.suficon, size: 17, color: Theme.of(context).primaryColor.withOpacity(0.3)))
                :GestureDetector(
                onTap:widget.callback,
                child: Icon(widget.suficon,size: 17,color: widget.color??null,)),
            enabledBorder: OutlineInputBorder(
              borderSide:  BorderSide(color: Theme.of(context).primaryColor,width: 1),
              borderRadius: BorderRadius.circular( 15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor,width: 1),
              borderRadius: BorderRadius.circular( 15),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor,width: 1),
              borderRadius: BorderRadius.circular( 15),
            ),
          ),
        ),
      ),
    );

  }
}

