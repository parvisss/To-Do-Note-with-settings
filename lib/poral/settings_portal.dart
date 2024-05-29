import 'package:flutter/material.dart';
import 'package:uzgaruvchi/controllers/setting_controller.dart';

class SettingPortal extends InheritedWidget {
  final SettingController settingController;
  SettingPortal({required this.settingController, required super.child});
  @override
  bool updateShouldNotify(covariant SettingPortal oldWidjet) {
    return oldWidjet.settingController != settingController;
  }

  static SettingController of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SettingPortal>()!
        .settingController;
  }
}
