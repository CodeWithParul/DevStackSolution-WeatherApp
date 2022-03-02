import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:flutter/material.dart';

class NetworkHelper {
  NetworkHelper(this.url);
  var url;
  Future getData() async {
    http.Response response = await http.get(url);
    String data = response.body;
    var decodedData = jsonDecode(data);
    return decodedData;
  }
}
