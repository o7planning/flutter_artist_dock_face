import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../flutter_artist_dock_face.dart';

/// An enterprise-grade, highly optimized mutable item cell component inside the [DockMenu].
///
/// Designed within the `FlutterArtist` framework ecosystem, [MenuItemView] governs visual
/// transformations, responsive layout bounds, and mouse-region hover states for individual rows.
/// It integrates an inner transparent [Material] canvas to secure double-pop proof touch feedback splits
/// across unified application layout tracks.
class MenuItemView extends StatefulWidget {
  /// The underlying structural model storing plain metadata, symbols, routing targets,
  /// or external callback pointers bound to this specific navigation item.
  final DockMenuItemModel menuModel;

  /// Dictates whether the application is running inside a compact, touch-first screen form factor
  /// to dynamically enforce alternative visual spacing parameters.
  final bool isMobile;

  /// The exact programmatic string identifier path matching the current active route location
  /// across the system navigation viewport history tracking stack.
  final String currentRoute;

  /// The active composite theme token property enforcing specific layout metrics, palettes,
  /// and custom hover decoration styles derived from the host framework ecosystem.
  final DockFaceStyle dockFaceStyle;

  /// Fires a unidirectional callback upstream immediately to route the global application state
  /// toward the explicit string indicators mapped within the target [menuModel].
  ///
  /// * [route]: The precise destination path targeting specific domain coordinate modules.
  final Function(String route) onNavigateTo;

  /// Constructs a declarative, production-ready mutable instance of [MenuItemView].
  const MenuItemView({
    super.key,
    required this.menuModel,
    required this.isMobile,
    required this.currentRoute,
    required this.dockFaceStyle,
    required this.onNavigateTo,
  });

  @override
  State<MenuItemView> createState() => _MenuItemViewState();
}

class _MenuItemViewState extends State<MenuItemView> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final dockFaceStyle = widget.dockFaceStyle;
    final bool isSelected =
        widget.menuModel.route != null &&
        widget.currentRoute == widget.menuModel.route;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (details) {
          if (widget.menuModel.route != null) {
            widget.onNavigateTo(widget.menuModel.route!);
          } else if (widget.menuModel.externalUrl != null) {
            _launchURL(widget.menuModel.externalUrl!);
          } else if (widget.menuModel.onPressed != null) {
            widget.menuModel.onPressed!(context, details);
          }
        },
        child: Container(
          margin: dockFaceStyle.dockStyle.itemMargin,
          decoration: BoxDecoration(
            color: (_isHovered || isSelected)
                ? dockFaceStyle.dockStyle.hoverColor
                : Colors.transparent,
            borderRadius: dockFaceStyle.dockStyle.borderRadius,
            border: Border.all(
              color: (_isHovered || isSelected)
                  ? (dockFaceStyle.dockStyle.hoverColor)
                  : Colors.transparent,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: ListTile(
              dense: true,
              visualDensity: const VisualDensity(horizontal: -3, vertical: -3),
              contentPadding: dockFaceStyle.dockStyle.itemPadding,
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    widget.menuModel.iconData,
                    color: dockFaceStyle.dockStyle.iconColor,
                    size: dockFaceStyle.dockStyle.iconSize,
                  ),
                  if (widget.menuModel.showText) const SizedBox(height: 5),
                  if (widget.menuModel.showText)
                    Text(
                      widget.menuModel.menuTitle ?? '',
                      textAlign: TextAlign.center,
                      style: dockFaceStyle.dockStyle.titleStyle.copyWith(
                        color: dockFaceStyle.dockStyle.textColor,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
