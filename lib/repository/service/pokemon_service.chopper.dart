// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$PokemonService extends PokemonService {
  _$PokemonService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = PokemonService;

  @override
  Future<Response<dynamic>> getPokemonAll() {
    final $url = '/api/v2/pokemon?limit=1118&offset=0';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getPokemonCount(String partUrl) {
    final $url = partUrl;
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
