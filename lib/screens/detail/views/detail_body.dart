import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_dex/screens/detail/bloc/detail_bloc.dart';

import 'detail_status.dart';

class DetailBody extends StatefulWidget {
  final String url;
  final String urlImage;

  const DetailBody({
    required this.url,
    required this.urlImage,
    Key? key
  }) : super(key: key);

  @override
  _DetailBodyState createState() => _DetailBodyState();
}

class _DetailBodyState extends State<DetailBody> {

  @override
  void initState() {
    context.read<DetailBloc>().add(
        GetDataPokeMonCountEvent(
            url: widget.url
        )
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Card(
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Image.network(
                    widget.urlImage,
                  ),
                ),
              ),
            ),
            elevation: 8,
            shadowColor: Colors.green,
            margin: EdgeInsets.all(20),
            shape: CircleBorder(side: BorderSide(
                width: 4,
                color: Colors.deepOrange
            ),
            ),
          ),
        ),
        BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            if(state.status == StatusLoadingDetailPage.loading){
              return Expanded(
                flex: 2,
                child: Center(
                    child: CircularProgressIndicator()
                ),
              );
            }else if(state.status == StatusLoadingDetailPage.success){
              return Expanded(
                  flex: 2,
                  child: DetailStatus()
              );
            }else{
              return Expanded(
                flex: 2,
                child: Center(
                    child: Text('Error!')
                ),
              );
            }
          },
        )
      ],
    );
  }
}
