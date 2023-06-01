import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

class Services {
  String endPoint = 'https://reqres.in/api/users';

  Future<List> getUsers() async {
    final response = await get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      return data;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final serviceProvider = Provider<Services>((ref) => Services());
