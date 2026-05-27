part of '../dock_face_screen.dart';

class DockMenuController extends ChangeNotifier {
  bool _isDockMenuExpanded = true;

  bool get isExpanded => _isDockMenuExpanded;

  void setExpanded({required bool expanded}) {
    if (_isDockMenuExpanded != expanded) {
      _isDockMenuExpanded = expanded;
      notifyListeners();
    }
  }

  void toggle() {
    setExpanded(expanded: !_isDockMenuExpanded);
  }
}
