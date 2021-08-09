part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class GetDataPokeMonAllEvent extends HomeEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchEvent extends HomeEvent {
  final String textSearch;
  SearchEvent({
    required this.textSearch
  });
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


enum FilterChoice{
  a_z,
  z_a,
  no
}
class FilterEvent extends HomeEvent {
  final FilterChoice filterChoice;
  FilterEvent({
    required this.filterChoice
  });

  @override
  // TODO: implement props
  List<Object?> get props => [filterChoice];
}

