part of 'detail_bloc.dart';

enum StatusLoadingDetailPage { loading, success, error }

class DetailState extends Equatable {
  final StatusLoadingDetailPage? status;
  final PokemonDetailModel? pokemonDetailModel;
  DetailState({
    this.status,
    this.pokemonDetailModel
  });

  DetailState copyWith({
    StatusLoadingDetailPage? status,
    PokemonDetailModel? pokemonDetailModel
  }){
    return DetailState(
      status: status ?? this.status,
      pokemonDetailModel: pokemonDetailModel ?? this.pokemonDetailModel
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    status,
    pokemonDetailModel
  ];
}
