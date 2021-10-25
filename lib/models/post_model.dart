

import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/comment_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'post_model.g.dart';

@JsonSerializable()
class Post extends Equatable{
  const Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
    this.comments = const<Comment>[],
  });
  final int id;
  final int userId;
  final String title;
  final String body;
  @JsonKey(ignore: true)
  final List<Comment> comments;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  
  Map<String, dynamic> toJson() => _$PostToJson(this);


Post copyWith({
  String? title,
  String? body,
  List<Comment>? comments,
}){
  return Post(
id:  this.id,
userId: this.userId,
title: title ?? this.title,
body: body ?? this.body,
comments: comments ?? this.comments,
  );
}

@override 
List<Object> get props => [userId, id, title, body, comments];
}