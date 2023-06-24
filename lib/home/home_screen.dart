import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {},
          child: const Row(
            children: [
              Text('구의동'),
              SizedBox(
                width: 10,
              ),
              FaIcon(
                FontAwesomeIcons.arrowDown,
                size: 20,
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.bars),
          ),
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
          ),
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.bell),
          ),
        ],
      ),
    );
  }
}
