import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:arkamaya_test/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../core/resources/consts/urls.dart';
import '../models/user_response.dart';
import 'package:http/http.dart' as client;

class UserRepository {
  Future<Either<Failure, List<User>>> getAll() async {
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
        return Right(
            UserResponse.fromJson(jsonDecode(response.body)).data ?? []);
      }
      throw ServerException();
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, User>> getOne(int id) async {
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
        return Right(User.fromJson(jsonDecode(response.body)));
      }
      throw ServerException();
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, bool>> createUser(
      {required String name, required String job}) async {
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
        return const Right(true);
        // UserResponse.fromJson(jsonDecode(response.body)).data ?? [];
      }
      throw ServerException();
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
