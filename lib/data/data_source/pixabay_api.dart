import 'dart:convert';

import 'package:http/http.dart' as http;

class PhotoApi {
  Future<Map<String, dynamic>> getPhotosInfoJson(String query) async {
    final responce = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=41486583-a8bebcb5b3331340ec13d3579&q=yellow+flowers&image_type=photo&pretty=true'));

    return jsonDecode(responce.body);
  }
}
