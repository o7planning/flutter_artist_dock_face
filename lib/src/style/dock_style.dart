import 'package:flutter/material.dart';

/// An enterprise-grade, immutable token class containing structural painting metrics
/// and decorative appearance rules for navigation dock viewports.
///
/// Designed for the `FlutterArtist` framework ecosystem, [DockStyle] consolidates all
/// spacing dimensions, color parameters, and typographic style rules into a single type-safe model.
/// It allows developers to customize side-drawer layouts cleanly without injecting hardcoded values.
class DockStyle {
  /// The concrete background canvas paint token coloring applied over the main dock layout frame.
  final Color backgroundColor;

  /// The explicit cross-axis horizontal size constraint allocated to the navigation drawer container layout.
  final double drawerWidth;

  /// The vertical spacing gap cleared out at the top of the container track to pad upper logo layouts.
  final double topSpacing;

  /// The vertical layout separator clearance gap established between adjacent menu item segments.
  final double itemSpacing;

  /// The primary thematic color profile applied onto vector icon assets inside inactive menu lanes.
  final Color iconColor;

  /// The default typographic paint color profile mapped over unselected item textual strings.
  final Color textColor;

  /// The active background tint block color flashed over an item layout frame during mouse track hover states.
  final Color hoverColor;

  /// The persistent background highlight fill color overlaying the active selected navigation menu row segment.
  final Color selectedColor;

  /// The typographic formatting and look parameters applied to style titles and menu plaintext rows.
  final TextStyle titleStyle;

  /// The structural layout cross-axis dimension boundary height and width assigned over vector icon graphics.
  final double iconSize;

  /// The outer layout boundary padding spacing cleared around each individual menu row wrapper box.
  final EdgeInsets itemMargin;

  /// The internal cell boundary cushioning clearance wrapped within the edges of individual menu rows.
  final EdgeInsets itemPadding;

  /// The circular curvature coordinate properties rounding off the sharp corners of interactive menu containers.
  final BorderRadius borderRadius;

  /// Initializes a production-grade, immutable declarative instance of [DockStyle] with explicit style metrics.
  const DockStyle({
    required this.backgroundColor,
    required this.drawerWidth,
    required this.topSpacing,
    required this.itemSpacing,
    required this.iconColor,
    required this.textColor,
    required this.hoverColor,
    required this.selectedColor,
    required this.titleStyle,
    required this.iconSize,
    required this.itemMargin,
    required this.itemPadding,
    required this.borderRadius,
  });

  /// Combines this style template configuration seamlessly with a secondary external style modifier token loop.
  ///
  /// Attributes defined within the [other] argument override this instance's baseline settings completely,
  /// while embedded typography text styles are resolved using an deep structural merge cascade.
  ///
  /// * [other]: The secondary configuration instance injected to overwrite layout properties.
  DockStyle merge(DockStyle? other) {
    if (other == null) return this;
    return DockStyle(
      backgroundColor: other.backgroundColor,
      drawerWidth: other.drawerWidth,
      topSpacing: other.topSpacing,
      itemSpacing: other.itemSpacing,
      iconColor: other.iconColor,
      textColor: other.textColor,
      hoverColor: other.hoverColor,
      selectedColor: other.selectedColor,
      titleStyle: titleStyle.merge(other.titleStyle),
      iconSize: other.iconSize,
      itemMargin: other.itemMargin,
      itemPadding: other.itemPadding,
      borderRadius: other.borderRadius,
    );
  }
}
