part of 'home_bloc.dart';

enum StatusLoadingHomePage { loading, success, error }

class HomeState extends Equatable {
  final StatusLoadingHomePage? status;
  final String? textSearch;
  final List<PokemonAllModel?>? pokemonAllModel;
  final List<PokemonAllModel?>? pokemonAllSave;
  HomeState({
    this.status,
    this.textSearch,
    this.pokemonAllModel,
    this.pokemonAllSave
  });

  HomeState copyWith({
    StatusLoadingHomePage? status,
    String? textSearch = "",
    List<PokemonAllModel?>? pokemonAllModel,
    List<PokemonAllModel?>? pokemonAllSave
  }){
    return HomeState(
      status: status ?? this.status,
      textSearch: textSearch ?? this.textSearch,
      pokemonAllModel: pokemonAllModel ?? this.pokemonAllModel,
      pokemonAllSave: pokemonAllSave ?? this.pokemonAllSave
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    status,
    textSearch,
    pokemonAllModel,
    pokemonAllSave
  ];
}



