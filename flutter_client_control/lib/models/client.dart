import 'package:flutter_client_control/models/client_type.dart';

class Client {
  String name;
  String email;
  ClientType type;

  Client({required this.name, required this.email, required this.type});
}
