import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Home/home_page.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/Screens/User/user_page.dart';

class DeatilsPage extends StatefulWidget {
  @override
  _DeatilsPageState createState() => _DeatilsPageState();
}

class _DeatilsPageState extends State<DeatilsPage> {
  int currentndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      UserPage(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("GitHub"),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              tooltip: "Logout",
              onPressed: () => Get.offAll(() => HomePage()))
        ],
      ),
      body: screens[currentndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentndex,
          unselectedItemColor: Colors.green,
          fixedColor: Colors.red,
          showUnselectedLabels: true,
          onTap: (_currentndex) {
            setState(() {
              currentndex = _currentndex;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "User"),
          ]),
    );
  }
}
