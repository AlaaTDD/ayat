import 'package:flutter/material.dart';



class CustomBotton extends StatefulWidget {
  final String name;
  final GestureTapCallback onPressed;
  final double height;
  final double width;
  final Color? color;
  final Color? colorr;
  CustomBotton({
    Key? key,
    required this.name,
    required this.onPressed,
    required this.height,
    required this.width,
    this.color,
    this.colorr,
  }) : super(key: key);
  @override
  State<CustomBotton> createState() => _CustomBottonState();
}

class _CustomBottonState extends State<CustomBotton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: widget.height,
        width: widget.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: widget.color, borderRadius: BorderRadius.circular(15)),
        child: Text(
          widget.name,
          style: TextStyle(
              color: widget.colorr, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
