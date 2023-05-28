import 'package:flutter/material.dart';

@immutable
class TodoModel {
  const TodoModel({
    this.user_id,
    this.id,
    required this.name,
    required this.description,
    this.status = false,
  });

  final String? user_id;
  final String? id;
  final String name;
  final String description;
  final bool status;

  factory TodoModel.fromMap(Map<String, dynamic> json) => TodoModel(
      user_id: json['user_id'],
      id: json['id'],
      name: json['name'],
      description: json['description'],
      status: json['status']);

  Map<String, dynamic> toMap() => <String, dynamic>{
        if (id != null) 'id': id,
        if (user_id != null) 'user_id': user_id,
        'name': name,
        'description': description,
        'status': status
      };

  TodoModel copyWith({
    String? user,
    String? id,
    String? name,
    String? description,
    bool? status,
  }) {
    return TodoModel(
      user_id: user ?? this.user_id,
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      status: status ?? this.status,
    );
  }
}
