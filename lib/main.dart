import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:flutter_application_1/screens/comments/bloc/comments_bloc.dart';
import 'package:flutter_application_1/screens/posts_page/bloc/posts_bloc.dart';
import 'package:flutter_application_1/screens/single_user_page/bloc/singleuser_bloc.dart';
import 'package:flutter_application_1/screens/users_page/bloc/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';

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
          create: (context) => SingleUserBloc()),
        BlocProvider(
          create: (context) => PostsBloc()),
        BlocProvider(
          create: (context) => CommentsBloc(),
        
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
    return  MaterialApp.router(
        routeInformationParser: const RoutemasterParser(),
                      routerDelegate:
                           RoutemasterDelegate(     
                               routesBuilder: (_) =>
                                         buildRouteMap()
                                                        ),
      );
      }
  }

