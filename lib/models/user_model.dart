import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User  extends Equatable{
  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;

@override 
List<Object> get props => [id,name,username,email,phone];

static const empty = User(id: -1 ,name: 'unknown', username: 'unknown',email: 'unknown',phone: 'unknown');

}
