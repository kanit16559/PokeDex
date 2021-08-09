import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_dex/screens/detail/bloc/detail_bloc.dart';
import 'package:poke_dex/theme/font.dart';

class DetailStatus extends StatelessWidget {
  const DetailStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 16,
                    left: 16,
                    right: 16
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Types',
                      style: textH1(Colors.black),
                    ),
                    Row(
                      children: [
                        for(int i = 0; i < context.watch<DetailBloc>().state.pokemonDetailModel!.types.length; i++)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      '${context.watch<DetailBloc>().state.pokemonDetailModel!.types[i].type.name}',
                                      style: textH2(Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: 10,
                        left: 10,
                        right: 10
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${context.watch<DetailBloc>().state.pokemonDetailModel!.stats[0].baseStat}',
                              style: textH1(Colors.deepOrange),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${context.watch<DetailBloc>().state.pokemonDetailModel!.stats[0].stat.name}',
                              style: textH2(Colors.black),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: 10,
                          left: 10,
                          right: 10
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${context.watch<DetailBloc>().state.pokemonDetailModel!.stats[1].baseStat}',
                              style: textH1(Colors.deepOrange),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${context.watch<DetailBloc>().state.pokemonDetailModel!.stats[1].stat.name}',
                              style: textH2(Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: 10,
                          left: 10,
                          right: 10
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${context.watch<DetailBloc>().state.pokemonDetailModel!.stats[2].baseStat}',
                              style: textH1(Colors.deepOrange),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${context.watch<DetailBloc>().state.pokemonDetailModel!.stats[2].stat.name}',
                              style: textH2(Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
