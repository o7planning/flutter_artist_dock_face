
# flutter_artist_dock_face

A highly efficient, independent, and lightweight full-screen page layout for Flutter. It features a compact, fixed, and non-expandable sidebar navigation dock while completely omitting the topbar area, making it perfect for minimalist dashboards, terminals, and content-focused workspaces.


[LIVE DEMO](https://o7planning.github.io/demo/flutter/flutter_artist_dock_face_demo/)

[Download Demo Source Code](https://github.com/o7planning/flutter_artist_dock_face_demo)

![FlutterArtist Dock Face Demo](https://o7planning.github.io/static/demo/flutter/flutter_artist_dock_face_demo/images/demo.gif)
---


## Features

* **Zero Dependencies:** Completely detached and decoupled from any external design token systems or style hubs.
* **Fixed Navigation Dock:** Built explicitly for a non-expandable vertical panel layout that stays structural and predictable.
* **No Topbar Framework:** Maximizes vertical viewport spaces by leaving the top layout open for content customization.
* **Fully Custom Color Presets:** Includes a reactive mapping mechanism that natively supports dark mode switches and hand-picked branding adjustments.

## Getting Started

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_artist_dock_face: ^lastest

```

## Usage

### 1. Define Your Custom Style

Extend `DockFaceScreen` and implement the mandatory layout parameters. You can easily map custom hex colors or utilize the built-in factory design rules.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_artist_dock_face/flutter_artist_dock_face.dart';

abstract class MyDockFaceScreen extends DockFaceScreen {
  final String currentRoute;

  const MyDockFaceScreen({super.key, required this.currentRoute});

  @override
  void onNavigateTo(BuildContext context, String route) {
    Navigator.of(context).pushReplacementNamed(route);
  }

  @override
  DockFaceStyle buildStyle(BuildContext context) {
    // Custom luxury dark navy branding block setup
    return const DockFaceStyle(
      scaffoldBackground: Color(0xFFF4F6FA),
      dockStyle: DockStyle(
        backgroundColor: Color(0xFF1E2541),
        iconColor: Color(0xFF94A3B8),
        textColor: Color(0xFFE2E8F0),
        drawerWidth: 75.0,
        topSpacing: 16.0,
        itemSpacing: 8.0,
        iconSize: 24.0,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        hoverColor: Color(0x13FFFFFF),
        selectedColor: Color(0xFF2F3860),
        titleStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
        itemMargin: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
        itemPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      ),
    );
  }

  @override
  Widget? buildLogo({required BuildContext context, required DockFaceStyle dockFaceStyle}) {
    return const Icon(Icons.palette_rounded, color: Colors.white, size: 28);
  }

  @override
  Widget? buildProfile({required BuildContext context, required DockFaceStyle dockFaceStyle}) {
    return const CircleAvatar(radius: 18, child: Text('FA'));
  }

  @override
  DockMenuItemModel? getDebugDockMenuItemModel() => null;

  @override
  DockMenuItemModel? getNotificationDockMenuItemModel() => null;

  @override
  DockMenuItemModel? getConfigurationDockMenuItemModel() => null;
}
```

### 2. Create Concrete Page Views

Now you only need to override the main content pane widget using `buildMainContent()`.

```dart
class DashboardScreen extends MyDockFaceScreen {
  const DashboardScreen({super.key}) : super(currentRoute: '/dashboard');

  @override
  Widget buildMainContent({
    required BuildContext context,
    required DockFaceStyle dockFaceStyle,
  }) {
    return Scaffold(
      backgroundColor: dockFaceStyle.scaffoldBackground,
      body: Center(
        child: Text(
          'Welcome to the Workspace!',
          style: TextStyle(color: dockFaceStyle.dockStyle.textColor),
        ),
      ),
    );
  }
}
```

## Additional Information

For issue reports, implementation feedback, or comprehensive design documentation, please visit the repository framework tracker at [o7planning GitHub Organization](https://github.com/o7planning).
 