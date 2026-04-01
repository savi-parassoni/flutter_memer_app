import 'dart:convert';

import 'package:flutter_memer/model/memes_response.dart';
import 'package:http/http.dart' as http;

abstract class Api {
  static String _baseUrl = 'https://api.imgflip.com';

  static Future<MemeResponse> getMemes() async {
    final response = await http.get(Uri.parse('$_baseUrl/get_memes'));
    if (response.statusCode == 200) {
      final MemeResponse memeResopnse = MemeResponse.fromJson(
        jsonDecode(response.body),
      );
      return memeResopnse;
    } else {
      throw Exception('Failed to load memes');
    }
  }
}
