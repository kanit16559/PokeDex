
import 'package:chopper/chopper.dart';
import 'package:poke_dex/constant/constant.dart';

part 'pokemon_service.chopper.dart';

@ChopperApi(baseUrl: '/')
abstract class PokemonService extends ChopperService{

  @Get()
  Future<Response<dynamic>> getPokemonAll();

  @Get()
  Future<Response<dynamic>> getPokemonCount(String partUrl);

  static PokemonService create(){
    final client = ChopperClient(
      baseUrl: Constant.url,
      services: [
        _$PokemonService(),
      ],
      converter: JsonConverter()
    );
    return _$PokemonService(client);
  }

}