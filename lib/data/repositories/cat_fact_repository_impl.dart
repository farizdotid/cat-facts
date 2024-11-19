import 'dart:convert';

import 'package:cat_fact/core/constants/api_constants.dart';
import 'package:cat_fact/data/models/cat_fact_dto.dart';
import 'package:cat_fact/domain/entities/cat_fact.dart';
import 'package:cat_fact/domain/repositories/cat_fact_repository.dart';
import 'package:http/http.dart' as http;

class CatFactRepositoryImpl implements CatFactRepository {
  final http.Client client;

  CatFactRepositoryImpl(this.client);

  @override
  Future<List<CatFact>> fetchCatFacts() async {
    final response =
        await client.get(Uri.parse('${ApiConstants.baseUrl}/facts'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData
          .map((data) => CatFactDto.fromJson(data).toEntity())
          .toList();
    } else {
      throw Exception('Failed to load cat facts');
    }
  }
}
