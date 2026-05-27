part of '../dock_face_screen.dart';

final menuDrawerController = DockMenuController();

/// An enterprise-grade navigation layout orchestrator widget serving as the
/// core container bar layout for dock-style dashboards.
///
/// Designed within the `FlutterArtist` framework ecosystem, [DockMenu] manages hierarchical
/// menu arrays, specialized system configurations, diagnostic tools, and reactive status modules.
/// It seamlessly layout positions branding emblems and structural account credentials from top to bottom.
class DockMenu extends StatefulWidget {
  /// Fires a unidirectional navigation routing handler callback upstream immediately
  /// upon any valid child menu selection events.
  ///
  /// * [route]: The targeted explicit resource string path used to swap screen contexts.
  final Function(String route) onNavigateTo;

  /// The complete structural collection array holding organized categorical groupings
  /// used to compile and render functional navigation buttons inside the main body track.
  final List<DockMenuGroupModel> drawerMenuGroupModels;

  /// Optional workspace configuration control parameters and preference properties
  /// bound to render the setup action option cell near the bottom utility dock.
  final DockMenuItemModel? configurationMenuItemModel;

  /// Optional isolated diagnostic tool metadata configurations used to mount
  /// the technical debugging item button cell near the terminal lane.
  final DockMenuItemModel? debugMenuItemModel;

  /// Optional alert signaling configuration models enabling real-time monitoring
  /// message flags and badge counts inside the notification action route segment.
  final DockMenuItemModel? notificationMenuItemModel;

  /// A specialized modular runtime builder intercepting the viewport pipeline
  /// to mount personalized user account metadata and graphics near the upper region track.
  final Widget? Function({
    required BuildContext context,
    required DockFaceStyle dockFaceStyle,
  })
  buildProfile;

  /// A functional brand layout builder compiling corporate branding emblems
  /// or localized system layout logos at the absolute upper crown apex margin.
  final Widget? Function({
    required BuildContext context,
    required DockFaceStyle dockFaceStyle,
  })
  buildLogo;

  /// The global active theme token property enforcing architectural rules, spacing metrics,
  /// color palettes, and typography configurations down across components.
  final DockFaceStyle dockFaceStyle;

  /// Constructs a declarative, production-ready mutable instance of [DockMenu].
  const DockMenu({
    super.key,
    required this.onNavigateTo,
    required this.drawerMenuGroupModels,
    required this.debugMenuItemModel,
    required this.notificationMenuItemModel,
    required this.configurationMenuItemModel,
    required this.buildProfile,
    required this.buildLogo,
    required this.dockFaceStyle,
  });

  @override
  State<StatefulWidget> createState() => _DockMenuState();
}

class _DockMenuState extends State<DockMenu> {
  @override
  void initState() {
    super.initState();
    menuDrawerController.addListener(_rebuild);
  }

  @override
  void dispose() {
    menuDrawerController.removeListener(_rebuild);
    super.dispose();
  }

  void _rebuild() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveHelper.isMobile(context);
    final String currentRoute = ModalRoute.of(context)?.settings.name ?? '';
    final dockFaceStyle = widget.dockFaceStyle;

    return Container(
      width: dockFaceStyle.dockStyle.drawerWidth,
      color: dockFaceStyle.dockStyle.backgroundColor,
      child: Material(
        color: Colors.transparent, // IMPORTANT!!
        child: Column(
          children: [
            _buildTop(context: context, dockFaceStyle: dockFaceStyle),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: widget.drawerMenuGroupModels
                      .map(
                        (group) => _buildMenuGroup(
                          context,
                          group,
                          isMobile,
                          currentRoute,
                          dockFaceStyle,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),

            if (widget.notificationMenuItemModel != null)
              _buildBottomItem(
                widget.notificationMenuItemModel!,
                isMobile,
                currentRoute,
                dockFaceStyle,
              ),
            if (widget.debugMenuItemModel != null)
              _buildBottomItem(
                widget.debugMenuItemModel!,
                isMobile,
                currentRoute,
                dockFaceStyle,
              ),
            if (widget.configurationMenuItemModel != null)
              _buildBottomItem(
                widget.configurationMenuItemModel!,
                isMobile,
                currentRoute,
                dockFaceStyle,
              ),
          ],
        ),
      ),
    );
  }

  /// Wraps standalone bottom menu configuration models safely into isolated [MenuItemView] nodes.
  Widget _buildBottomItem(
    DockMenuItemModel model,
    bool isMobile,
    String route,
    DockFaceStyle dockFaceStyle,
  ) {
    return MenuItemView(
      menuModel: model,
      isMobile: isMobile,
      currentRoute: route,
      dockFaceStyle: dockFaceStyle,
      onNavigateTo: widget.onNavigateTo,
    );
  }

  /// Compiles a stylized group category section wrapping nested menu arrays inside a clean [ExpansionTile] layout track.
  Widget _buildMenuGroup(
    BuildContext context,
    DockMenuGroupModel group,
    bool isMobile,
    String route,
    DockFaceStyle dockFaceStyle,
  ) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        initiallyExpanded: true,
        showTrailingIcon: false,
        title: group.showHeader
            ? Divider(height: 4, color: dockFaceStyle.dockStyle.iconColor)
            : const SizedBox.shrink(),
        children: group.menus
            .map(
              (menu) => MenuItemView(
                menuModel: menu,
                isMobile: isMobile,
                currentRoute: route,
                dockFaceStyle: dockFaceStyle,
                onNavigateTo: widget.onNavigateTo,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Combines individual logo and avatar image assets safely inside the upper crested zone layout.
  Widget _buildTop({
    required BuildContext context,
    required DockFaceStyle dockFaceStyle,
  }) {
    final Widget? logo = widget.buildLogo(
      context: context,
      dockFaceStyle: dockFaceStyle,
    );
    final Widget? profile = widget.buildProfile(
      context: context,
      dockFaceStyle: dockFaceStyle,
    );
    return Column(
      children: [
        if (logo != null) logo,
        if (logo != null) SizedBox(height: dockFaceStyle.dockStyle.topSpacing),
        if (profile != null) profile,
        if (profile != null)
          SizedBox(height: dockFaceStyle.dockStyle.topSpacing),
      ],
    );
  }
}
