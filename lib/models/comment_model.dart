import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_model.g.dart';

@JsonSerializable()
class Comment extends Equatable {
const Comment({
 required this.postId,
 required this.id,
 required this.name,
 required this.email,
 required this.body,
});  
final int postId;
final int id;
final String name;
final String email;
final String body;

factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
 Map<String, dynamic> toJson() => _$CommentToJson(this);



@override 
List<Object> get props => [postId, id, name, email, body];
}