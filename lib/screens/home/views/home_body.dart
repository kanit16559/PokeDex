import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_dex/router/detail_args.dart';
import 'package:poke_dex/screens/home/bloc/home_bloc.dart';
import 'package:poke_dex/screens/home/views/search_widget.dart';
import 'package:poke_dex/theme/font.dart';

import 'filter.dart';
import 'gridViewPokemon.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {

  @override
  void initState() {
    // TODO: implement initState
    context.read<HomeBloc>().add(GetDataPokeMonAllEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Pole Dex'
          ),
          actions: [
            PopupMenuButton<Filter>(
              icon: Icon(Icons.filter_list),
              onSelected: (value){
                if(value.event == 'a_z'){
                  context.read<HomeBloc>().add(
                    FilterEvent(
                      filterChoice: FilterChoice.a_z
                    )
                  );
                }else if(value.event == 'z_a'){
                  context.read<HomeBloc>().add(
                      FilterEvent(
                          filterChoice: FilterChoice.z_a
                      )
                  );
                }else{
                  context.read<HomeBloc>().add(
                      FilterEvent(
                          filterChoice: FilterChoice.no
                      )
                  );
                }
              },
              itemBuilder: (context){
                return choices.map((Filter filter) {
                  return PopupMenuItem<Filter>(
                    value: filter,
                    child: Text(
                      filter.title,
                      style: TextStyle(color: Colors.black87, fontFamily: 'Sarabun'),
                    ),
                  );
                }).toList();
              }
            )
          ],
        ),
        body: BlocConsumer <HomeBloc, HomeState>(
          listener: (context, state){
          },
          builder: (context, state){
            return Column(
              children: [
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SearchWidget(),
                            SizedBox(
                              height: 10,
                            ),
                            if(state.status == StatusLoadingHomePage.loading)
                              Expanded(
                                child: Center(
                                    child: CircularProgressIndicator()
                                ),
                              ),
                            if(state.status == StatusLoadingHomePage.success)
                              state.pokemonAllModel!.length == 0 ?
                                  Padding(
                                    padding:  EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        "don't have this name",
                                        style: textH3(Colors.black87),
                                      ),
                                    ),
                                  )
                                : Expanded(
                                  child: GridViewPokemon()
                              ),
                          ],
                        )
                    )
                ),
              ],
            );
            // if(state.status == StatusLoading.loading){
            //   return CircularProgressIndicator();
            // }else if(state.status == StatusLoading.success){
            //
            // }else if(state.status == StatusLoading.error){
            //   return Center(
            //     child: Text('Error GetData!!!'),
            //   );
            // }
            // return Center(
            //   child: Text('Error Page!!!'),
            // );
          },
        )


        // body: FutureBuilder<PokemonCountModel?>(
        //   future: dataPokemonAll,
        //   builder: (context, snapshot){
        //     switch(snapshot.connectionState) {
        //       case ConnectionState.none:
        //       case ConnectionState.waiting:
        //         return Center(child: CircularProgressIndicator());
        //       default:
        //         if(snapshot.hasError){
        //           return Text('Error: ${snapshot.error}');
        //         }else{
        //           return Column(
        //             children: [
        //               Expanded(
        //                 child: Padding(
        //                   padding: const EdgeInsets.all(8.0),
        //                   child: listPokemon(snapshot.data),
        //                 )
        //               ),
        //             ],
        //           );
        //         }
        //     }
        //   }
        // )
    ),
      );
  }
}
