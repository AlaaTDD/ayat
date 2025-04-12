import 'package:flutter/material.dart';


class ScaleAnimationItem extends StatefulWidget {
  final int index;
  final Widget child;
   ScaleAnimationItem({super.key,required this.index,required this.child});

  @override
  State<ScaleAnimationItem> createState() => _ScaleAnimationItemState();
}

class _ScaleAnimationItemState extends State<ScaleAnimationItem>with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double>_animation;
  @override
  void initState() {
    _animationController=AnimationController(vsync: this,duration: Duration(milliseconds: 900));
    _animation=CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    _animationController.forward(from: widget.index*0.02);
    super.initState();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ScaleTransition(child: widget.child,scale: _animation,);
  }
}
class SlideAnimationItem extends StatefulWidget {
  final int index;
  final Widget child;
  SlideAnimationItem({super.key, required this.index, required this.child});

  @override
  State<SlideAnimationItem> createState() => _SlideAnimationItemState();
}

class _SlideAnimationItemState extends State<SlideAnimationItem> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 900));
    _animation = Tween<Offset>(
      begin: Offset(0.0, 1.0), // Start position (bottom of the screen)
      end: Offset(0.0, 0.0),   // End position (original position)
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    _animationController.forward(from: widget.index * 0.2);
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
      position: _animation,
      child: widget.child,
    );
  }
}