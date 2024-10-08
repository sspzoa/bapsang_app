import 'api_interface.dart';
import 'interceptors/log.dart';

class ProdApiProvider extends ApiProvider {
  final baseUrl = 'https://bapsang.sspzoa.io';

  ProdApiProvider() {
    dio.options.baseUrl = baseUrl;
    dio.interceptors.add(LogInterceptor());
  }
}
