import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/posts_page/bloc/posts_bloc.dart';
import 'package:flutter_application_1/screens/posts_page/view/posts_page.dart';
import 'package:flutter_application_1/screens/single_user_page/bloc/singleuser_bloc.dart';
import 'package:flutter_application_1/screens/single_user_page/view/single_user_page.dart';
import 'package:flutter_application_1/screens/users_page/bloc/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';

// class TabsPage extends StatefulWidget {
//   TabsPage({Key? key,required this.index}): super(key: key);
 
// int index;
//   @override
//   _TabsPageState createState() => _TabsPageState();
// }

// class _TabsPageState extends State<TabsPage> {

// @override
// void initState(){
//   currentndex = widget.index;
//   super.initState();
// }


//  late int currentndex;

//   @override
//   Widget build(BuildContext context) {
//     final userId = context.watch<SingleUserBloc>().state.user.id;
//     // first
//     // context.read<SingleUserBloc>().add(FetchUser(userId)); 
//     // context.read<PostsBloc>().add(PostsFetched(userId));
//     final screens = [
//       SingleUserPage(),
//       PostsPage(),
//     ];
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("GitHub"),
//         backgroundColor: Colors.teal,
//         actions: [
//           IconButton(
//               icon: Icon(Icons.logout),
//               tooltip: "Logout",
//               onPressed: () => Navigator.of(context).pop())
//         ],
//       ),
//       body: screens[currentndex],
//       bottomNavigationBar: BottomNavigationBar(
//           currentIndex: currentndex,
//           unselectedItemColor: Colors.green,
//           fixedColor: Colors.red,
//           showUnselectedLabels: true,
//           onTap: (_currentndex) {
//             setState(() {
//               currentndex = _currentndex;
             
//             });
//             switch(_currentndex){
//              case 0://refresh
//              context.read<SingleUserBloc>().add(FetchUser(userId)); break;

//              case 1://refresh
//              context.read<PostsBloc>().add(PostsFetched(userId)); break;
//           }},
//           items: [
//             BottomNavigationBarItem(icon: Icon(Icons.person), label: "User"),
//             BottomNavigationBarItem(icon: Icon(Icons.message), label: "Posts"),
//           ]),
//     );
//   }
// }



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