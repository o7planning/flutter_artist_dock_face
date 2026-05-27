part of 'menu_model.dart';

/// An enterprise-grade data layout model representing a logical grouping section
/// inside the global navigation dock ecosystem.
///
/// Designed for the `FlutterArtist` framework, [DockMenuGroupModel] consolidates a collection
/// of individual menu targets under a unified header block featuring optional title and subtitle tracks.
class DockMenuGroupModel {
  /// The primary plaintext title label drawn as the header text for this specific menu category section.
  final String title;

  /// The secondary descriptive plaintext subtitle string providing contextual overview details for this group lane.
  final String subtitle;

  /// Dictates whether the group section header track (title, subtitle, and layout dividers) mounts onto the interface canvas.
  final bool showHeader;

  /// The underlying collection array holding all interactive operational menu action item models assigned to this partition.
  final List<DockMenuItemModel> menus;

  /// Constructs a standard, production-ready immutable declarative instance of [DockMenuGroupModel].
  const DockMenuGroupModel({
    required this.title,
    required this.subtitle,
    required this.menus,
    this.showHeader = true,
  });
}
