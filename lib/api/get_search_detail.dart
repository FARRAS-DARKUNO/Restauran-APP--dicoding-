import 'api.dart';
import 'dart:convert';

import '../model/Searching/seacrhingdata.dart';

class RestauranSearch {
  final Api? api = Api();

  Future<SearchingDara> getSeacrh(String query) async {
    var url = "http://restaurant-api.dicoding.dev/search?q=" + query;
    if (query == null || query == '') {
      url = "http://restaurant-api.dicoding.dev/search?q=saajhh";
    }

    final response = await api!.get(url);

    var jsonResponse = jsonDecode(response);
    print(jsonResponse.runtimeType);

    final restaurant = SearchingDara.fromJson(jsonResponse);
    return restaurant;
  }
}
