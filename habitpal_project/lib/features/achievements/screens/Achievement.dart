import 'package:flutter/material.dart';
import 'package:habitpal_project/utils/color_utils.dart';
import 'package:habitpal_project/widgets/BottomNav.dart';
import 'package:routemaster/routemaster.dart';
// import 'package:habitpal_project/widgets/BottomNav.dart';

class Achievement extends StatefulWidget {
  const Achievement({super.key});

  @override
  State<Achievement> createState() => _AchievementState();
}

class _AchievementState extends State<Achievement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Routemaster.of(context).replace('/settings');
            },
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        ],
        centerTitle: true,
        title: const Text(
          "History",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        )
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
          hexToColor("315b7d"), // #B4E1C5 to #ABCEAF to #B0DDD9
          hexToColor("1d4769"), // #315b7d to #1d4769 to #223F57
          hexToColor("223F57")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}