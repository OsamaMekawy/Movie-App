import 'dart:async';


import 'package:clean_archticture2/TVs/Domain/usecases/get_now_playing_movis.dart';
import 'package:clean_archticture2/TVs/Domain/usecases/get_poupler_movis.dart';
import 'package:clean_archticture2/TVs/Domain/usecases/get_top_reated_movis.dart';


import 'package:clean_archticture2/TVs/presentation/controller/movies_events.dart';
import 'package:clean_archticture2/TVs/presentation/controller/movies_states.dart';
import 'package:clean_archticture2/core/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesBloc extends Bloc<MoviesEvents,MoviesState>{
  final GetNowPlayingMovies getNowPlayingMovies;
  final GetNowPouplerMovies getNowPouplerMovies;
  final GetNowTopReatedMovies getNowTopReatedMovies;
  MoviesBloc(this.getNowPlayingMovies,this.getNowTopReatedMovies,this.getNowPouplerMovies) : super (const MoviesState()){

    on <GetNowPlayingMoviesEvent>( (event, emit) async {

      final results = await getNowPlayingMovies.execute();


      results.fold(
              (l) =>emit(state.copyWith(
              nowPlayingState: ReqestState.error,
              nowPlayingMessage:l.message
          )),

              (r) =>emit(
                state.copyWith(
                  nowPlayingMovies: r,
                  nowPlayingState: ReqestState.Loaded,

                )
              )
      );

    });

    on <GetPouplerMoviesEvent>( (event, emit) async {

      final results = await getNowPouplerMovies.execute();


      results.fold((l) =>
      emit(
        state.copyWith(
          pouplerState: ReqestState.error,
          pouplerMessage: l.message
        )),


              (r) =>emit(
                state.copyWith(
                  pouplerMovies: r,
                  pouplerState: ReqestState.Loaded
                )
              )
      );

    });

    on <GetTopReatedMoviesEvent>(_getTopReatedMovies);

  }

  FutureOr<void> _getTopReatedMovies(GetTopReatedMoviesEvent event, Emitter<MoviesState> emit)async {
    final results = await getNowTopReatedMovies.execute();

    results.fold((l) => emit(
      state.copyWith(
        topReatedState: ReqestState.error,
        topReatedMessage: l.message
      )
    ),
            (r) => emit(
              state.copyWith(
                topReatedMovies: r,
                topReatedState: ReqestState.Loaded
              )
            )
    );
  }
}