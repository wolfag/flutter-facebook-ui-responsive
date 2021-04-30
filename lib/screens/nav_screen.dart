import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../data/data.dart';
import '../widgets/widgets.dart';
import 'home.dart';

class NavScreens extends StatefulWidget {
  const NavScreens({Key key}) : super(key: key);

  @override
  _NavScreensState createState() => _NavScreensState();
}

class _NavScreensState extends State<NavScreens> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];
  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = Responsive.isDesktop(context);

    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: isDesktop
            ? PreferredSize(
                preferredSize: Size(screenSize.width, 100),
                child: CustomAppBar(
                  currentUser: currentUser,
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) => setState(() {
                    _selectedIndex = index;
                  }),
                ),
              )
            : null,
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: !isDesktop
            ? Container(
                padding: const EdgeInsets.only(
                  bottom: 12,
                ),
                color: Colors.white,
                child: CustomTabBar(
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
