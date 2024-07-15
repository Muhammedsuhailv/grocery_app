import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../model/api_model_test.dart';

class   GetProduct extends ChangeNotifier{
  List <Product> getpro= [];
  
  List <Product> get products => getpro;
  
  Future<List> fetchproduct()async{
    final response = await http.get(Uri.parse("https://dummyjson.com/products"));
    if (response.statusCode == 200) {
      log(response.body);
      print("hhhhhhhhh${response.body}");
      Map<String, dynamic> data = json.decode(response.body);
      getpro = data as List<Product>;
      notifyListeners();
      return getpro;
    } else {
      throw Exception('Failed to load Products');
    }
  }
}