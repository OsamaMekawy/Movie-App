import 'package:clean_archticture2/TVs/presentation/controller/movies_bloc.dart';
import 'package:clean_archticture2/TVs/presentation/controller/movies_events.dart';
import 'package:clean_archticture2/TVs/presentation/controller/movies_states.dart';
import 'package:clean_archticture2/core/servises/servises_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return BlocProvider(
       create: (BuildContext context){
         return MoviesBloc(sl(),sl(),sl())..add(GetNowPlayingMoviesEvent())..add(GetPouplerMoviesEvent())..add(GetTopReatedMoviesEvent());
       },
     child: BlocBuilder<MoviesBloc, MoviesState>(
       builder:  (context,state){
         return const Scaffold();
       },
     ),
   );
  }
}
