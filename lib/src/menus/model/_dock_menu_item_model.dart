part of 'menu_model.dart';

/// An enterprise-grade, immutable data token class mapping operational parameters,
/// graphics, and routing properties for an individual navigation item inside the dock.
///
/// Tailored for the `FlutterArtist` core orchestration layer, it utilizes an explicit mutual exclusivity constraint
/// enforced via a strict compile-time assert rule to guarantee an item operates as either a system route link,
/// an external web URL, or a local tap down execution callback cleanly.
class DockMenuItemModel {
  /// The unique programmatic machine-readable plaintext key token tracking this item node across the framework state lifecycle.
  final String code;

  /// The plaintext human-readable label run displayed alongside the menu icon graphic layout.
  final String? menuTitle;

  /// An optional collection array containing peripheral route string keys that should trigger this specific item
  /// to flag itself as selected when active in navigation history.
  final List<String>? markAsSelectedForRoutes;

  /// The targeted system internal named route path indicator used to trigger implicit screen transitions.
  final String? route;

  /// The absolute external web link path resource directed to fire outbound web browser engine pipelines.
  final String? externalUrl;

  /// Dispatches programmatic tap gestures and positional coordinates upstream immediately upon user touch inputs.
  final Function(BuildContext context, TapDownDetails details)? onPressed;

  /// Holds numeric parameter values to feed interactive alert badge counters or telemetric status flags inside the button cell.
  final int? notifyValue;

  /// The multi-level cascading sub-track layer holding granular lower-tier menu action structures nested beneath this model.
  final List<DockSubMenuItemModel> subMenuItems;

  /// The material vector symbol icon asset drawn inside the main center viewport line of the button layout.
  final IconData iconData;

  /// Dictates if the [menuTitle] plaintext run unmounts from the rendering tree to allow ultra-compact icon-only layouts.
  final bool showText;

  /// Constructs a completely production-ready declarative instance of [DockMenuItemModel] with verified explicit parameter exclusivity.
  ///
  /// * Throws an [AssertionError] if more or less than exactly one navigation target channel ([route], [externalUrl], or [onPressed]) is configured.
  const DockMenuItemModel({
    required this.code,
    required this.iconData,
    required this.notifyValue,
    this.menuTitle,
    this.route,
    this.showText = true,
    required this.markAsSelectedForRoutes,
    this.externalUrl,
    this.onPressed,
    this.subMenuItems = const [],
  }) : assert(
         (route != null && externalUrl == null && onPressed == null) ||
             (route == null && externalUrl != null && onPressed == null) ||
             (route == null && externalUrl == null && onPressed != null),
       );

  /// Evaluates whether this item matches the active interface view, extracting current settings straight from native Flutter components.
  ///
  /// Replaced dependency on external state frameworks (e.g., GetX) to guarantee native type-safe compatibility.
  /// Returns `true` if the [currentRoute] strictly matches [route] or exists inside the [markAsSelectedForRoutes] array.
  ///
  /// * [currentRoute]: The programmatic text string targeting the active screen name extracted from the system pipeline.
  bool isSelected(String currentRoute) {
    return (route == currentRoute) ||
        (markAsSelectedForRoutes != null &&
            markAsSelectedForRoutes!.contains(currentRoute));
  }
}
