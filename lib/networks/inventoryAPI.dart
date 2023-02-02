import 'dart:convert';

import 'package:flutterapi/networks/userAPI.dart';
import 'package:http/http.dart' as http;

import '../models/stock.dart';

class InventoryAPI {
  String url = 'https://prp-app-money.herokuapp.com/inventory';

  Future<List<Stock?>?> getAll() async {
    UserAPI userAPI = UserAPI();
    String? TOKEN = await userAPI.getToken();
    var urlApi = Uri.parse('$url/');
    final response = await http.get(
      urlApi,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $TOKEN'
      },
    );
    if (response.statusCode == 200) {
      //print(response.body);
      final List result = jsonDecode(response.body);
      List<Stock> data = result.map((e) => Stock.fromJson(e)).toList();
      return data;
    }
    return null;
  }

  Future<Stock?> creatStock({required Stock stock}) async {
    UserAPI userAPI = UserAPI();
    String? TOKEN = await userAPI.getToken();
    var urlApi = Uri.parse('$url/');
    final response = await http.post(urlApi,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $TOKEN'
        },
        encoding: Encoding.getByName('utf-8'),
        body: jsonEncode(stock));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return Stock.fromJson(result);
    }
    return null;
  }

  Future<Stock?> updateStock({required Stock stock}) async {
    UserAPI userAPI = UserAPI();
    String? TOKEN = await userAPI.getToken();
    var urlApi = Uri.parse('$url/${stock.id}');
    final response = await http.put(urlApi,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $TOKEN'
        },
        encoding: Encoding.getByName('utf-8'),
        body: jsonEncode(stock));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return Stock.fromJson(result);
    }
    return null;
  }

  Future<String?> deleteStock({required int id}) async {
    UserAPI userAPI = UserAPI();
    String? TOKEN = await userAPI.getToken();
    var urlApi = Uri.parse('$url/$id');
    final response = await http.delete(urlApi, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $TOKEN'
    });
    if (response.statusCode == 200) {
      return jsonDecode(response.body)["detail"];
    } else {
      return null;
    }
  }
}
