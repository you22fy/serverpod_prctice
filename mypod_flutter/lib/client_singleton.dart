import 'package:mypod_client/mypod_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

class ClientSingleton {
  late Client client;

  static final ClientSingleton _instance = ClientSingleton._internal();

  factory ClientSingleton() {
    return _instance;
  }

  ClientSingleton._internal() {
    client = Client('http://$localhost:8080/')
      ..connectivityMonitor = FlutterConnectivityMonitor();
  }
}
