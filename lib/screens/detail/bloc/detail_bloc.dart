import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:poke_dex/models/pokemon_detail_model.dart';
import 'package:poke_dex/repository/pokemon_repository.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailState(
    status: StatusLoadingDetailPage.loading
  ));

  @override
  Stream<DetailState> mapEventToState(DetailEvent event,) async* {
    if(event is GetDataPokeMonCountEvent){
      PokemonDetailModel? pokemonDetailModel =await PokemonRepository().getPokemonCount(event.url);
      yield state.copyWith(
        status: StatusLoadingDetailPage.success,
        pokemonDetailModel: pokemonDetailModel
      );
    }
  }
}
