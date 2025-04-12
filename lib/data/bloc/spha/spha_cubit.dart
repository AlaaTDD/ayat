import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rive/rive.dart';

part 'spha_state.dart';

class SphaCubit extends Cubit<SphaState> {
  Artboard? artboardf;
  StateMachineController? controllerf;
  SMITrigger? triggerf;
  int i = 0;
  SphaCubit() : super(SphaInitial());
  static SphaCubit get(context) => BlocProvider.of(context);
  Future<void> loadRiveFile() async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final file = await RiveFile.asset('assets/rive/sphaf.riv');
      final artboard = file.mainArtboard;
      final controller = StateMachineController.fromArtboard(artboard, 'State Machine 1');
      if (controller != null) {
        artboard.addController(controller);
        _debugPrintInputs(controller);
        triggerf = _findTriggerInput(controller);
        artboardf = artboard;
        controllerf = controller;
        emit(success());
      }
    } catch (e) {
      debugPrint('حدث خطأ في تحميل ملف Rive: $e');
    }
  }

  void _debugPrintInputs(StateMachineController controller) {
    debugPrint('==== جميع المدخلات المتاحة ====');
    for (final input in controller.inputs) {
      debugPrint('المدخل: "${input.name}" (${input.name.codeUnits}) - النوع: ${input.runtimeType}');
    }
  }

  SMITrigger? _findTriggerInput(StateMachineController controller) {
    for (final input in controller.inputs) {
      final cleanedName = input.name.trim().toLowerCase();
      if (cleanedName.contains('trigger')) {
        if (input is SMITrigger) {
          debugPrint('تم العثور على المدخل المطلوب: ${input.name}');
          return input;
        } else {
          debugPrint('المدخل ${input.name} ليس من نوع SMITrigger');
        }
      }
    }
    debugPrint('لم يتم العثور على أي مدخل يحتوي على كلمة Trigger');
    return null;
  }

  void fireTrigger() {
    if (i < 99) {
      i++;
      emit(success());
    } else {
      i = 0;
      emit(success());
    }
    if (triggerf != null) {
      triggerf!.fire();
      debugPrint('تم تفعيل Trigger بنجاح');
    } else {
      debugPrint('Trigger غير متاح');
    }
  }
}