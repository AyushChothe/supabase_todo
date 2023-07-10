// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TodoModel _$$_TodoModelFromJson(Map<String, dynamic> json) => _$_TodoModel(
      user_id: json['user_id'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String,
      status: json['status'] as bool? ?? false,
    );

Map<String, dynamic> _$$_TodoModelToJson(_$_TodoModel instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'status': instance.status,
    };
