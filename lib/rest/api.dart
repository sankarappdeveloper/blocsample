import 'dart:convert';

import 'package:blocsample/model/listresponse.dart';
import 'package:http/http.dart' as http;

import 'dart:convert' as convert;

class Api {
  String BASE_URL = "retoolapi.dev";

  List<Listresponse>? listresponse = [];

  @override
  Future<List<Listresponse>?> getlist() async {
    var response = await http.get(Uri.https(BASE_URL, "/Kq1Mnp/data"),
        headers: {"Content-type": "application/json"});
    print(response.body);

    listresponse = (json.decode(response.body) as List)
        .map((data) => Listresponse.fromJson(data))
        .toList();
    print(listresponse);
    return listresponse;
  }
}
