import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapi/model/Mithran.dart';
import 'package:myapi/model/Products.dart';

class Apiservice{

  Future<List<Products>?> fetchdata()  async {
    final responce=await http.get(Uri.parse("https://dummyjson.com/products"));
    var jsonn=jsonDecode(responce.body);
    var data=mithranFromJson(jsonn);
    var list=data.products;
    return list;
  }
}