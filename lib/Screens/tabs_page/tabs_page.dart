import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/single_user_page/view/single_user_page.dart';


class TabsPage extends StatefulWidget {
  TabsPage({Key? key,required this.index}): super(key: key);
int index;
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {

@override
void initState(){
  currentndex = widget.index;
  super.initState();
}


 late int currentndex;

  @override
  Widget build(BuildContext context) {
    final screens = [
      SingleUserPage(),
      SingleUserPage(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("GitHub"),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              tooltip: "Logout",
              onPressed: () => Navigator.of(context).pop())
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
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "User"),
          ]),
    );
  }
}
