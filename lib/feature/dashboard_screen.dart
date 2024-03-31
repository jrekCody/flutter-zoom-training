import 'package:flutter/material.dart';
import 'package:flutter_zoom/utils/color_util.dart';
import 'package:flutter_zoom/utils/string_util.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorUtil.blackColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.comment_bank),
            label: StringUtil.meetChat,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock),
            label: StringUtil.meeting,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: StringUtil.contacts,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: StringUtil.settings,
          ),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => _onDestinationSelected(
          context,
          index,
        ),
      ),
    );
  }

  void _onDestinationSelected(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
