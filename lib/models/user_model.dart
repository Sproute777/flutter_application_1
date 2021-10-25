import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/post_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'user_model.g.dart';

@JsonSerializable()
class User  extends Equatable{
  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    this.posts = const <Post>[],
    // this.albums = const <Album>[],
    // this.todos = const <Todo>[],
    // this.photos = const <Photo>[],
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  @JsonKey(ignore: true)
  final List<Post> posts;

@override 
List<Object> get props => [id,name,username,email,phone, posts];

static const empty = User(id: -1 ,name: 'unknown', username: 'unknown',email: 'unknown',phone: 'unknown', posts: const <Post>[]);

}
