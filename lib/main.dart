import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/single_user_page/bloc/singleuser_bloc.dart';
import 'package:flutter_application_1/screens/tabs_page/tabs_page.dart';
import 'package:flutter_application_1/screens/users_page/bloc/user_bloc.dart';
import 'package:flutter_application_1/screens/users_page/view/users_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(RestRetrofitApp());
}

class RestRetrofitApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    // Get.put(ApiController()).fetchAllUser();
   return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>  UsersBloc()..add(UsersFetched()),
        ),
        BlocProvider(
          create: (context) => SingleUserBloc(),
        ),
      ],
      child:  App()

    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => UsersPage(),
        '/tabs/user': (context) => TabsPage(index: 0)
      }
      );
      }
  }

