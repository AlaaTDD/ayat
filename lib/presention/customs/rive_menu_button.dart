import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import '../../data/bloc/darkmode/darkmode_cubit.dart';
import '../resorces/size_app.dart';

class RiveMenuButton extends StatefulWidget {
  final void Function(bool isOpen)? onToggle;

  const RiveMenuButton({super.key, this.onToggle});

  @override
  State<RiveMenuButton> createState() => _RiveMenuButtonState();
}

class _RiveMenuButtonState extends State<RiveMenuButton> {
  Artboard? _artboard;
  StateMachineController? _controller;
  SMIInput<bool>? _isOpen;
  bool _isVisible = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 700), () {
      _initRive();
    });
  }

  Future<void> _initRive() async {
    final data = await rootBundle.load('assets/rive/darkmode.riv');
    final file = RiveFile.import(data);
    final artboard = file.mainArtboard;

    final controller =
    StateMachineController.fromArtboard(artboard, 'State Machine 1');

    if (controller != null) {
      artboard.addController(controller);
      _isOpen = controller.findInput<bool>('isOpen');
      final isDark = DarkmodeCubit.get(context).state is DarkmodeInitial &&
          (DarkmodeCubit.get(context).state as DarkmodeInitial).isDarkMode;

      _isOpen?.value = isDark;

      setState(() {
        _artboard = artboard;
        _controller = controller;
        _isVisible = true;
      });
    }
  }

  void _toggle() {
    if (_isOpen != null) {
      _isOpen!.value = !_isOpen!.value;
      DarkmodeCubit.get(context).toggleTheme();
      widget.onToggle?.call(_isOpen!.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _toggle,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: SizedBox(
            width: getResponsiveFontSize(context,iphoneSize: 60,ipadMediumSize: 80,ipadLargeSize: 80),
            height: 100,
            child: AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: _artboard == null
                  ? const SizedBox()
                  : RepaintBoundary(
                child: Rive(artboard: _artboard!),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
