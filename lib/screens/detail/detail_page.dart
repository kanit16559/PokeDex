import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_dex/screens/detail/views/detail_body.dart';

import 'bloc/detail_bloc.dart';


class DetailPage extends StatelessWidget {
  final String name;
  final String url;
  final String urlImage;

  const DetailPage({
    Key? key,
    required this.name,
    required this.url,
    required this.urlImage
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        appBar: AppBar(
          title: Text('$name'),
        ),
        body: BlocProvider(
          create: (context) => DetailBloc(),
          child: DetailBody(
            url: url,
            urlImage: urlImage,
          )
        )
    );
  }
}
