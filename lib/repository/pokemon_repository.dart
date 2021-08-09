import 'package:chopper/chopper.dart';
import 'package:poke_dex/constant/constant.dart';
import 'package:poke_dex/models/pokemon_all_model.dart';
import 'package:poke_dex/models/pokemon_detail_model.dart';
import 'package:poke_dex/repository/service/pokemon_service.dart';

class PokemonRepository{

  final PokemonService bioConsentApiService = PokemonService.create();

  Future<List<PokemonAllModel>?> getPokemonAll() async{
    final Response<dynamic> response = await bioConsentApiService.getPokemonAll();
    if(response.statusCode == 200){
      List<PokemonAllModel> listPokemonAllModel = [];
      List<dynamic> dataBody = response.body['results'];
      dataBody.asMap().forEach((index, element) {
        String indexImage = element['url'];
        List<String> strSplit =  indexImage.split("/");
        element['url_image'] = "${Constant.urlPokeMonImage}${strSplit[6]}.png";
        element['no'] = (index+1).toString();
        listPokemonAllModel.add(PokemonAllModel.fromJson(element));
      });
      return listPokemonAllModel;
    }else{
      print('Error!!!');
      return null;
    }
  }

  Future<PokemonDetailModel?> getPokemonCount(String partUrl) async{
    final Response<dynamic> response = await bioConsentApiService.getPokemonCount(partUrl);
    if(response.statusCode == 200){
      Map<String, dynamic>  dataBody = response.body;
      Map<String, dynamic>  newDataBody = {
        "types" : dataBody['types'],
        "stats" : dataBody['stats'],
      };
      String str = newDataBody.toString();
      return PokemonDetailModel.fromJson(newDataBody);
    }else{
      print('Error!!!');
      return null;
    }
  }




}