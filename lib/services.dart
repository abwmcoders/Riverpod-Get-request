import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:riverpod_api/models/user_models.dart';

class ApiServices {
  static const String endPoint = "https://reqres.in/api/users?page=2";
  Future<List<UserModel>> getUser() async {
    Response response = await get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)["data"];
      return result.map((e) => UserModel.frmJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}



