import 'package:dio/dio.dart';

class NewsDataSource {
  Future<List<dynamic>> getNews() async {
    final dio = Dio();
    final headers = {
      "Connection": "keep-alive",
    };
    final response = await dio.get("https://newsdata.io/api/1/news",
        queryParameters: {
          'language': 'en',
          'apiKey': 'pub_16493927cb2096744b536c6e5a0525dd0d689',
          'q': 'travel'
        },
        options: Options(
          headers: headers,
          validateStatus: (status) => true,
          responseType: ResponseType.json,
        ));

    if (response.statusCode == 200) {
      return response.data['results'];
    } else {
      throw Exception();
    }
  }
}
