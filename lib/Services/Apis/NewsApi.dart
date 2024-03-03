import 'package:get/get.dart';

import '../../main.dart';

class NewsApi extends GetConnect {
  // Will do api call and return future
  // get() | it's get method which have api url and headers to do api call
  Future<Response> getNews() async =>
      get('${utils.apiUrl}/markets/news', headers: utils.getHeaders());
}
