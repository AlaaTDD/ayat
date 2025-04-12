import 'package:flutter/material.dart';


class SlideAnimation extends StatefulWidget {
  final int index;
  final Widget child;
  SlideAnimation({super.key,required this.index,required this.child});
  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}
class _SlideAnimationState extends State<SlideAnimation>with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset>_animation;
  @override
  void initState() {
    _animationController=AnimationController(vsync: this,duration: Duration(milliseconds: 900));
    _animation=Tween<Offset>(
      begin: Offset(1.5, 0),
      end: Offset(0, 0)
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOut));
    _animationController.forward(from: widget.index*0.2);
    super.initState();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      child: widget.child,
      position: _animation,);
  }
}
