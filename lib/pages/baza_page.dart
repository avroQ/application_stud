// main_page.dart
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '/pages/notifications_page.dart';
import '/pages/profile_page.dart';
import '/pages/settings_page.dart';
import '/pages/groups_page.dart';

class BazaPage extends StatefulWidget {
  BazaPage({super.key});

  @override
  State<BazaPage> createState() => _BazaPageState();
}

class _BazaPageState extends State<BazaPage> {
  // keeps track of the index
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    GroupsPage(),
    NotificationsPage(),
    SettingsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.group_add),
            label: 'Группы',
            backgroundColor: Colors.deepOrange[300],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Уведомления',
            backgroundColor: Colors.deepOrange[300],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Настройки',
            backgroundColor: Colors.deepOrange[300],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
            backgroundColor: Colors.deepOrange[300],
          ),
        ],
      ),
    );
  }
}
