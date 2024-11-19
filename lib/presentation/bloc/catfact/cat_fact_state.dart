import 'package:cat_fact/domain/entities/cat_fact.dart';

abstract class CatFactState {}

class CatFactInitial extends CatFactState {}

class CatFactLoading extends CatFactState {}

class CatFactLoaded extends CatFactState {
  final List<CatFact> facts;

  CatFactLoaded(this.facts);
}

class CatFactFetchError extends CatFactState {
  final String message;

  CatFactFetchError(this.message);
}
