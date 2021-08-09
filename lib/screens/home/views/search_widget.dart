import 'package:flutter/material.dart';
import 'package:poke_dex/screens/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_dex/theme/font.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final homeState = context.watch<HomeBloc>().state.pokemonAllModel;
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey)),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          // print('icon_search!!!');
                          // print('${homeState!.results!.length}');
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.search),
                        ),
                      )),
                  Expanded(
                    flex: 6,
                    child: TextFormField(
                      initialValue: context.watch<HomeBloc>().state.textSearch,
                      onChanged: (value) {
                        context.read<HomeBloc>().add(
                          SearchEvent(
                            textSearch: value
                          )
                        );
                      },
                      autocorrect: false,
                      style: textH3(Colors.black),
                      decoration: InputDecoration(
                        hintText: 'search',
                        contentPadding: EdgeInsets.fromLTRB(
                          0,
                          0,
                          5,
                          0,
                        ),
                        isDense: true,
                        // important line
                        hintStyle: textH3(Colors.black54),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
