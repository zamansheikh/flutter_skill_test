import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_skill_test/features/home/data/models/house_model.dart';
import 'package:flutter_skill_test/features/home/domain/entities/house.dart';
import 'package:http/http.dart' as http;

abstract class HomeFakeRemoteDatasource {
  /// Calls the local data List of Houses
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<House>> fetchAllHouse();
}

class HomeFakeRemoteDatasourceImpl implements HomeFakeRemoteDatasource {
  final http.Client client;
  HomeFakeRemoteDatasourceImpl({required this.client});

  @override
  Future<List<HouseModel>> fetchAllHouse() async {
    final String response =
        await rootBundle.loadString('assets/json/houses.json');
    final List<dynamic> data = jsonDecode(response);
    await Future.delayed(Duration(seconds: 2));
    return data.map((e) => HouseModel.fromJson(e)).toList();
  }
}
