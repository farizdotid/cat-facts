import 'package:cat_fact/domain/repositories/cat_fact_repository.dart';
import 'package:cat_fact/presentation/bloc/catfact/cat_fact_event.dart';
import 'package:cat_fact/presentation/bloc/catfact/cat_fact_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatFactBloc extends Bloc<CatFactEvent, CatFactState> {
  final CatFactRepository repository;

  CatFactBloc(this.repository) : super(CatFactInitial()){
    on<FetchCatFacts>((event, emit) async {
      emit(CatFactLoading());

      try{
        final facts = await repository.fetchCatFacts();
        emit(CatFactLoaded(facts));
      } catch(e){
        emit(CatFactFetchError('Failed to fetch cat facts'));
      }
    });
  }


}
