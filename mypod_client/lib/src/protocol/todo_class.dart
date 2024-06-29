/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Todo implements _i1.SerializableModel {
  Todo._({
    this.id,
    required this.name,
    required this.isDone,
  });

  factory Todo({
    int? id,
    required String name,
    required bool isDone,
  }) = _TodoImpl;

  factory Todo.fromJson(Map<String, dynamic> jsonSerialization) {
    return Todo(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      isDone: jsonSerialization['isDone'] as bool,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  bool isDone;

  Todo copyWith({
    int? id,
    String? name,
    bool? isDone,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'isDone': isDone,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TodoImpl extends Todo {
  _TodoImpl({
    int? id,
    required String name,
    required bool isDone,
  }) : super._(
          id: id,
          name: name,
          isDone: isDone,
        );

  @override
  Todo copyWith({
    Object? id = _Undefined,
    String? name,
    bool? isDone,
  }) {
    return Todo(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      isDone: isDone ?? this.isDone,
    );
  }
}
