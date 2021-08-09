import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke_dex/router/detail_args.dart';
import 'package:poke_dex/screens/detail/detail_page.dart';
import 'package:poke_dex/screens/home/home_page.dart';

class RouteGenerate {
  static Route<dynamic> generateRoute(RouteSettings settings){
    final Object? args = settings.arguments;
    switch(settings.name){
      case '/':
        return MaterialPageRoute(
            builder: (_) => HomePage()
        );
      case '/detail':
        print('--- :${args}');

        if(args == null){
          return _errorRoute();
        }else{
          if(checkHasInvalidArgs<DetailArgs>(args, isRequired: true)){
            return _errorRoute();
          }else{
            final typeArgs = args as DetailArgs;
            return MaterialPageRoute(
                builder: (_) => DetailPage(
                  name: typeArgs.name,
                  url: typeArgs.url,
                  urlImage: typeArgs.urlImage,
                )
            );
          }
        }
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
                'Error'
            ),
          ),
          body: Center(
            child: Text('ERROR'),
          ),
        );
      }
    );
  }
}

bool checkHasInvalidArgs<T>(Object? args, {bool isRequired = false}) {
  if (isRequired) {
    return (args is! T);
  } else {
    return (args != null && args is! T);
  }
}