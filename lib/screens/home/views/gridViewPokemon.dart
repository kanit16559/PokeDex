import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_dex/models/pokemon_all_model.dart';
import 'package:poke_dex/router/detail_args.dart';
import 'package:poke_dex/screens/home/bloc/home_bloc.dart';
import 'package:poke_dex/theme/font.dart';

class GridViewPokemon extends StatelessWidget {
  const GridViewPokemon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // PokemonAllModel? homeBloc = context.watch<HomeBloc>().state.pokemonAllModel;
    // print('in : ${homeBloc!.results!.length}');
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisExtent: 250,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemCount: context.watch<HomeBloc>().state.pokemonAllModel!.length,
      itemBuilder: (context, index){
        String? _name = context.watch<HomeBloc>().state.pokemonAllModel?[index]!.name;
        String? _url = context.watch<HomeBloc>().state.pokemonAllModel?[index]!.url;
        String? _urlImage = context.watch<HomeBloc>().state.pokemonAllModel?[index]!.urlImage;
        return GestureDetector(
          onTap: (){
            // print('${context.watch<HomeBloc>().state.pokemonAllModel?[index]!.url}');
              Navigator.pushNamed(context, '/detail', arguments: DetailArgs(
                name: _name!,
                url: _url!,
                urlImage: _urlImage!
            ));
            // context.read<HomeBloc>().add(NavigatorToDetailPageEvent(index: index));
          },
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.cyan,
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Image.network(
                      '${context.watch<HomeBloc>().state.pokemonAllModel![index]!.urlImage}',
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                        return Center(
                          child: Text(
                            'No Picture',
                            style: textH3(Colors.red),
                          )
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: 2
                    ),
                    child: Column(
                      children: [
                        Text(
                          'No. ${context.watch<HomeBloc>().state.pokemonAllModel![index]!.no}',
                          style: textH3(Colors.white),
                        ),
                        Text(
                          '${context.watch<HomeBloc>().state.pokemonAllModel![index]!.name}',
                          style: textH3(Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        );
      }
    );
  }
}
