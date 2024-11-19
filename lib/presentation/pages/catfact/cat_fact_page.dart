import 'package:cat_fact/presentation/bloc/catfact/cat_fact_bloc.dart';
import 'package:cat_fact/presentation/bloc/catfact/cat_fact_event.dart';
import 'package:cat_fact/presentation/bloc/catfact/cat_fact_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatFactPage extends StatelessWidget {
  final CatFactBloc bloc;

  CatFactPage(this.bloc);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc..add(FetchCatFacts()),
      child: Scaffold(
        appBar: AppBar(title: Text('Cat Facts')),
        body: BlocBuilder<CatFactBloc, CatFactState>(
          builder: (context, state) {
            if (state is CatFactLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CatFactLoaded) {
              return ListView.builder(
                itemCount: state.facts.length,
                itemBuilder: (context, index) {
                  final fact = state.facts[index];
                  return ListTile(
                    title: Text(fact.text),
                    subtitle: Text(fact.id),
                  );
                },
              );
            } else if (state is CatFactFetchError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('Press the button to fetch cat facts!'));
          },
        ),
      ),
    );
  }
}