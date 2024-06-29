import 'package:serverpod/serverpod.dart';

class MyEchoEndpoint extends Endpoint {
  Future<String> myEcho(Session session, String message) async {
    return message;
  }
}
