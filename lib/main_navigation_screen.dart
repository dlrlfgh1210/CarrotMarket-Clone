import 'package:flutter/material.dart';
import 'package:flutter_carrot_market/home/home_screen.dart';
import 'package:flutter_carrot_market/nav_tab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const HomeScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: Container(),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: Container(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: Container(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: Container(),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavTab(
                text: "홈",
                isSelected: _selectedIndex == 0,
                icon: Icons.other_houses_outlined,
                selectedIcon: FontAwesomeIcons.house,
                onTap: () => _onTap(0),
              ),
              NavTab(
                text: "동네생활",
                isSelected: _selectedIndex == 1,
                icon: FontAwesomeIcons.paperPlane,
                selectedIcon: FontAwesomeIcons.solidPaperPlane,
                onTap: () => _onTap(1),
              ),
              NavTab(
                text: "내 근처",
                isSelected: _selectedIndex == 2,
                icon: Icons.location_on_outlined,
                selectedIcon: FontAwesomeIcons.locationDot,
                onTap: () => _onTap(2),
              ),
              NavTab(
                text: "채팅",
                isSelected: _selectedIndex == 3,
                icon: FontAwesomeIcons.comments,
                selectedIcon: FontAwesomeIcons.solidComments,
                onTap: () => _onTap(3),
              ),
              NavTab(
                text: "나의 당근",
                isSelected: _selectedIndex == 4,
                icon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
                onTap: () => _onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
