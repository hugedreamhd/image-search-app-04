import 'dart:convert';

import 'package:http/http.dart' as http;

import '../dto/pixabay_dto.dart';

class PixabayApi {
  Future<PixabayDto> getImageResult(String query) async {
    final responce = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=41486583-a8bebcb5b3331340ec13d3579&q=$query&image_type=photo&pretty=true'));

    return PixabayDto.fromJson(jsonDecode(responce.body));
  }
}
