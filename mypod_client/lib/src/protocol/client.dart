/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:mypod_client/src/protocol/todo_class.dart' as _i3;
import 'protocol.dart' as _i4;

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointMyEcho extends _i1.EndpointRef {
  EndpointMyEcho(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'myEcho';

  _i2.Future<String> myEcho(String message) =>
      caller.callServerEndpoint<String>(
        'myEcho',
        'myEcho',
        {'message': message},
      );
}

/// {@category Endpoint}
class EndpointTodo extends _i1.EndpointRef {
  EndpointTodo(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'todo';

  _i2.Future<List<_i3.Todo>> getAllTodos() =>
      caller.callServerEndpoint<List<_i3.Todo>>(
        'todo',
        'getAllTodos',
        {},
      );

  _i2.Future<void> addTodo({required _i3.Todo todo}) =>
      caller.callServerEndpoint<void>(
        'todo',
        'addTodo',
        {'todo': todo},
      );

  _i2.Future<List<_i3.Todo>> updateTodo({required _i3.Todo todo}) =>
      caller.callServerEndpoint<List<_i3.Todo>>(
        'todo',
        'updateTodo',
        {'todo': todo},
      );

  _i2.Future<bool> deleteTodo({required int id}) =>
      caller.callServerEndpoint<bool>(
        'todo',
        'deleteTodo',
        {'id': id},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
  }) : super(
          host,
          _i4.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    example = EndpointExample(this);
    myEcho = EndpointMyEcho(this);
    todo = EndpointTodo(this);
  }

  late final EndpointExample example;

  late final EndpointMyEcho myEcho;

  late final EndpointTodo todo;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'example': example,
        'myEcho': myEcho,
        'todo': todo,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
