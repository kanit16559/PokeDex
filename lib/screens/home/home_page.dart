import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_dex/screens/home/views/home_body.dart';
import 'bloc/home_bloc.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: HomeBody(),
    );
  }
}


// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//   Future<PokemonCountModel?>? dataPokemonAll;
//  
//   @override
//   void initState() {
//     dataPokemonAll = PokemonRepository().getPokemonAll();
//     super.initState();
//   }
//
//   Widget listPokemon(PokemonCountModel? pokemonCountModel){
//     return GridView.builder(
//       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//           maxCrossAxisExtent: 200,
//           childAspectRatio: 3 / 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10),
//       itemCount: pokemonCountModel!.results!.length,
//       itemBuilder: (context, index){
//         return Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           color: Colors.cyan,
//           child: Column(
//             children: [
//               Expanded(
//                 child: Image.network(
//                   '${pokemonCountModel.results![index].urlImage}'
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   bottom: 2
//                 ),
//                 child: Column(
//                   children: [
//                     Text(
//                       'No. ${index + 1}',
//                       style: textH1(Colors.white),
//                     ),
//                     Text(
//                       '${pokemonCountModel.results![index].name}',
//                       style: textH1(Colors.white),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       }
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Pole Dex'
//         ),
//         actions: [
//           IconButton(
//             onPressed: (){
//               Navigator.pushNamed(context, '/detail', arguments: DetailArgs(
//                   namePage: "DetailPage",
//                   number: 11
//               ));
//             },
//             icon: Icon(Icons.add)
//           )
//         ],
//       ),
//       body: FutureBuilder<PokemonCountModel?>(
//         future: dataPokemonAll,
//         builder: (context, snapshot){
//           switch(snapshot.connectionState) {
//             case ConnectionState.none:
//             case ConnectionState.waiting:
//               return Center(child: CircularProgressIndicator());
//             default:
//               if(snapshot.hasError){
//                 return Text('Error: ${snapshot.error}');
//               }else{
//                 return Column(
//                   children: [
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: listPokemon(snapshot.data),
//                       )
//                     ),
//                   ],
//                 );
//               }
//           }
//         }
//       )
//     );
//   }
// }
