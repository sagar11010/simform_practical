import 'package:dio/dio.dart';
import 'api_constants.dart';

class HttpClient<T> {
  Future get(
    url, {
    required Map<String, String> headers,
    required Map<String, dynamic> queryParameters,
  }) async {
    queryParameters['results'] = 100;
    final uri = ApiConstants.baseUrl + url;
    try {
      final response = await Dio().get(uri, queryParameters: queryParameters);
       return response.data;
    } on DioError catch (e) {
       throw e.response!.data['message'];
    }
  }
}

