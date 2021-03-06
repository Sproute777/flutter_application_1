import 'package:flutter_application_1/pages/comments/view/comment_page.dart';
import 'package:flutter_application_1/pages/posts_page/view/posts_page.dart';
import 'package:flutter_application_1/pages/single_user_page/view/single_user_page.dart';
import 'package:flutter_application_1/pages/tabs_page/tabs_page.dart';
import 'package:flutter_application_1/pages/users_page/view/users_page.dart';
import 'package:routemaster/routemaster.dart';
import 'package:flutter/material.dart';
import 'dart:convert';


RouteMap buildRouteMap() {
  return RouteMap(
  routes: {


   '/': (_) => MaterialPage(
          child: UsersPage(),
          ),
    '/comments/:postId': (info){
       final postId = int.parse(info.pathParameters['postId']!);
    return MaterialPage(child: CommentsPage(postId: postId));},      
// ---------------------------------------------------------
  '/tab-bar': (_) => TabPage(
            child: const TabBarPage(),
            paths: [
                  'user',
                  'post'
                   ],
                 ),
  '/tab-bar/user': (_) => const MaterialPage(child: SingleUserPage()),
  '/tab-bar/post': (_) =>  MaterialPage(
                                      child: PostsPage(),
                 ),
  } 
 );
}
   

