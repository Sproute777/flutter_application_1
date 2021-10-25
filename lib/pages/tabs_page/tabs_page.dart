import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';




class TabBarPage extends StatelessWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabPage = TabPage.of(context);

    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: tabPage.controller,
          tabs: [
              const Tab(
              icon: Icon(Icons.person),
              text: 'User',
            ),
              const Tab(
              icon: Icon(Icons.message),
              text: 'Posts',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabPage.controller,
        children: [
          for (final stack in tabPage.stacks) PageStackNavigator(stack: stack),
        ],
      ),
    );
  }
}