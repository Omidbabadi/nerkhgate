import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:myapp/core/extensions/context_extension.dart';

abstract class CoreUtils {
  const CoreUtils();

  static void postFrameCallback(VoidCallback callback) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  static Color adabtiveColor(
    BuildContext context, {
    required Color lightModeColour,
    required Color darkModeColur,
  }) {
    return context.isDarkMode ? darkModeColur : lightModeColour;
  }
}
