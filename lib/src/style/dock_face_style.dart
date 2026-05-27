import 'package:flutter/material.dart';

import '../../flutter_artist_dock_face.dart';
import 'dock_style.dart';

// Assuming DockStyle pathing setup exists safely inside your local workspace matrix
// import 'package:flutter_artist_face/src/styles/dock_style.dart';

/// An enterprise-grade style configuration wrapper orchestrating the complete visual
/// ecosystem and layout theme mapping for dock-style dashboard screens.
///
/// Designed as a core theme token inside the `FlutterArtist` framework, [DockFaceStyle] binds
/// the root canvas background context seamlessly with specific structural rendering rules inside [DockStyle].
class DockFaceStyle {
  /// The foundational canvas paint token color profile applied across the main hosting [Scaffold] background.
  final Color scaffoldBackground;

  /// The embedded configuration layout dataset regulating metrics, padding, and colors inside navigation elements.
  final DockStyle dockStyle;

  /// Pure explicit constructor demanding comprehensive parameters.
  const DockFaceStyle({
    required this.scaffoldBackground,
    required this.dockStyle,
  });

  /// Factory blueprint engine building an entirely unified setup from a single Flutter [seedColor].
  ///
  /// Dynamically computes material [ColorScheme] values to handle brightness adaptation shifts safely,
  /// auto-injecting a premium dark navy fallback (`0xFF1E2541`) under light configuration modes to secure
  /// a high-contrast enterprise theme feel.
  ///
  /// * [seedColor]: The primary core color origin vector used to generate the functional palette track.
  /// * [brightness]: Dictates whether the system architecture parses dark or light design layout rules.
  factory DockFaceStyle.simple(
    Color seedColor, {
    Brightness brightness = Brightness.light,
  }) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: brightness,
    );
    final isDark = brightness == Brightness.dark;

    // Premium high-contrast layout block palette setup
    final Color sidebarBg = isDark
        ? colorScheme.surfaceContainerLow
        : const Color(
            0xFF1E2541,
          ); // Use the classic premium dark navy by default for light mode

    return DockFaceStyle(
      scaffoldBackground: isDark
          ? colorScheme.surface
          : const Color(0xFFF4F6FA),
      dockStyle: DockStyle(
        backgroundColor: sidebarBg,
        drawerWidth: 75.0,
        topSpacing: 10.0,
        itemSpacing: 2.0,
        iconColor: isDark
            ? colorScheme.onSurfaceVariant
            : const Color(0xFF94A3B8),
        textColor: isDark ? colorScheme.onSurface : const Color(0xFFE2E8F0),
        hoverColor: isDark
            ? colorScheme.primary.withValues(alpha: 0.08)
            : Colors.white.withValues(alpha: 0.08),
        selectedColor: isDark
            ? colorScheme.primary.withValues(alpha: 0.15)
            : const Color(0xFF2F3860),
        titleStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.normal,
        ),
        iconSize: 24.0,
        itemMargin: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        itemPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  /// Default baseline safety values fallback matching the core architecture guide.
  ///
  /// Automatically seeds the master setup utilizing the framework standard [Colors.indigo] token safely.
  factory DockFaceStyle.defaults() => DockFaceStyle.simple(Colors.indigo);

  /// Prioritize 'other' values but fallback to current values safely.
  ///
  /// Merges text style parameters through a deep cascading overlay flow while replacing
  /// structural canvas parameters cleanly.
  ///
  /// * [other]: The external input style modifier injected to overwrite baseline settings.
  DockFaceStyle merge(DockFaceStyle? other) {
    if (other == null) return this;
    return DockFaceStyle(
      scaffoldBackground: other.scaffoldBackground,
      dockStyle: dockStyle.merge(other.dockStyle),
    );
  }
}
