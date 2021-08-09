import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:poke_dex/models/pokemon_all_model.dart';
import 'package:poke_dex/repository/pokemon_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(status: StatusLoadingHomePage.loading));

  @override
  Stream<HomeState> mapEventToState(HomeEvent event,) async* {
    if (event is GetDataPokeMonAllEvent) {
      List<PokemonAllModel>? pokemonCountModel = await PokemonRepository()
          .getPokemonAll();
      yield state.copyWith(
          status: StatusLoadingHomePage.success,
          pokemonAllModel: pokemonCountModel,
          pokemonAllSave: pokemonCountModel
      );
    } else if (event is SearchEvent) {
      List<PokemonAllModel> dataResults = [];
      List<PokemonAllModel?>? getStateSave = List.from(state.pokemonAllSave!);
      if (event.textSearch.isNotEmpty) {
        List<PokemonAllModel> itemDemo = [];
        getStateSave.forEach((item) {
          if (item!.name.contains(event.textSearch)) {
            itemDemo.add(item);
          }
        });
        yield state.copyWith(
            textSearch: event.textSearch,
            pokemonAllModel: itemDemo
        );
      } else {
        List<PokemonAllModel?>? getStateSave = List.from(state.pokemonAllSave!);
        yield state.copyWith(
            textSearch: event.textSearch,
            pokemonAllModel: getStateSave
        );
      }
    } else if (event is FilterEvent) {
      List<PokemonAllModel?>? getStateAllModel = List.from(state.pokemonAllModel!);
      if(event.filterChoice == FilterChoice.a_z){
        getStateAllModel.sort((a, b) {
          return a!.name.toLowerCase().compareTo(b!.name.toLowerCase());
        });
        yield state.copyWith(
          pokemonAllModel: getStateAllModel
        );
      }else if(event.filterChoice == FilterChoice.z_a){
        getStateAllModel.sort((a, b) {
          return b!.name.toLowerCase().compareTo(a!.name.toLowerCase());
        });
        yield state.copyWith(
            pokemonAllModel: getStateAllModel
        );
      }else if(event.filterChoice == FilterChoice.no){
        List<PokemonAllModel?>? getStateSave = List.from(state.pokemonAllSave!);
        yield state.copyWith(
            pokemonAllModel: getStateSave
        );
      }
    }
  }
}


