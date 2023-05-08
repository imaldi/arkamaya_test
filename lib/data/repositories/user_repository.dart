import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../../core/resources/consts/urls.dart';
import '../models/user_response.dart';
import 'package:http/http.dart' as client;

class UserRepository {
  Future<List<User>> getAll() async {
    try{
      final url = Uri.https(baseUrl, usersUrl);
      print("URL login remote data source: $url");
      final response = await client.get(
        url,
        headers: {'Accept': 'application/json'},
      ).timeout(const Duration(seconds: 5), onTimeout: (){
        throw TimeoutException("Ini ada yang salah");
      });
      if(response.statusCode == HttpStatus.ok){
        return UserResponse.fromJson(jsonDecode(response.body)).data ?? [];
      }
      return [];
    } catch(e) {
      throw Exception();
      // throw something
    }
  }
}