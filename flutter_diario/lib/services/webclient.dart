import 'package:flutter_diario/services/http_interceptors.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:http/http.dart' as http;

class WebClient {
  static const String url = "http://192.168.3.22:3000/";
  http.Client client = InterceptedClient.build(
    interceptors: [LoggerInterceptor()],
    requestTimeout: Duration(seconds: 5),
  );
}
