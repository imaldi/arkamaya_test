import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../../core/resources/consts/urls.dart';
import '../models/user_response.dart';
import 'package:http/http.dart' as client;

class UserRepository {
  Future<List<User>> getAll() async {
    try {
      final url = Uri.https(baseUrl, usersUrl);
      print("URL get all user: $url");
      final response = await client.get(
        url,
        headers: {'Accept': 'application/json'},
      ).timeout(const Duration(seconds: 5), onTimeout: () {
        throw TimeoutException("Ini ada yang salah");
      });
      if (response.statusCode == HttpStatus.ok) {
        return UserResponse.fromJson(jsonDecode(response.body)).data ?? [];
      }
      return [];
    } catch (e) {
      throw Exception();
      // throw something
    }
  }

  Future<User> getOne(int id) async {
    try {
      final url = Uri.https(baseUrl, "$usersUrl/$id");
      print("URL get one user: $url");
      final response = await client.get(
        url,
        headers: {'Accept': 'application/json'},
      ).timeout(const Duration(seconds: 5), onTimeout: () {
        throw TimeoutException("Ini ada yang salah");
      });
      if (response.statusCode == HttpStatus.ok) {
        return User.fromJson(jsonDecode(response.body));
      }
      // TODO handle dengan bagus nanti
      throw Exception;
    } catch (e) {
      throw Exception();
      // throw something
    }
  }

  Future<bool> createUser({required String name, required String job}) async {
    try {
      final url = Uri.https(baseUrl, usersUrl);
      print("URL login remote data source: $url");
      final response = await client.post(url, headers: {
        'Accept': 'application/json'
      }, body: {
        "name": name,
        "job": job,
      }).timeout(const Duration(seconds: 5), onTimeout: () {
        throw TimeoutException("There is a failure");
      });
      if (response.statusCode == HttpStatus.ok) {
        return true;
        // UserResponse.fromJson(jsonDecode(response.body)).data ?? [];
      }
      return false;
    } catch (e) {
      throw Exception();
      // throw something
    }
  }
}
