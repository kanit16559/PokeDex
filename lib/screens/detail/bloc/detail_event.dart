part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();
}

class GetDataPokeMonCountEvent extends DetailEvent {
  String url;
  GetDataPokeMonCountEvent({
    required this.url
 });

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
