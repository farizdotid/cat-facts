import 'package:cat_fact/data/repositories/cat_fact_repository_impl.dart';
import 'package:cat_fact/presentation/bloc/catfact/cat_fact_bloc.dart';
import 'package:cat_fact/presentation/pages/catfact/cat_fact_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  final repository = CatFactRepositoryImpl(http.Client());
  final bloc = CatFactBloc(repository);

  runApp(MyApp(bloc));
}

class MyApp extends StatelessWidget {
  final CatFactBloc bloc;

  MyApp(this.bloc);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Facts',
      home: CatFactPage(bloc)
    );
  }
}