import 'package:http_interceptor/http_interceptor.dart';
import 'package:logger/logger.dart';

class LoggerInterceptor extends InterceptorContract {
  Logger logger = Logger();

  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    logger.t(
      '----- Request -----\n${request.toString()}\n${request.headers.toString()}',
    );
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({
    required BaseResponse response,
  }) async {
    if (response.statusCode ~/ 100 == 2) {
      logger.i('----- Response -----\nCode: ${response.statusCode}');
      if (response is Response) {
        logger.i((response).body);
      }
    } else {
      logger.e('----- Response -----\nCode: ${response.statusCode}');
      if (response is Response) {
        logger.e((response).body);
      }
    }

    return response;
  }
}
