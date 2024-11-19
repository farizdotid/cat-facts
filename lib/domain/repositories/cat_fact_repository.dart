import '../entities/cat_fact.dart';

abstract class CatFactRepository {
  Future<List<CatFact>> fetchCatFacts();
}