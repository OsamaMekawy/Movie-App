import 'dart:async';

import 'package:clean_archticture2/TVs/Domain/usecases/baseusecase.dart';
import 'package:clean_archticture2/TVs/Domain/usecases/get_movie_details.dart';
import 'package:clean_archticture2/TVs/Domain/usecases/get_recommendation_usecase.dart';
import 'package:clean_archticture2/TVs/presentation/controller/movie_details_event.dart';
import 'package:clean_archticture2/TVs/presentation/controller/movie_details_state.dart';
import 'package:clean_archticture2/core/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent,MovieDetailsState>{
  MovieDetailsBloc(this.getMovieDetailsUsecase,this.getRecommendationUseCase) : super (const MovieDetailsState()){
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendetionEvent>(_getRecommendetion);
  }

  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  final GetRecommendationUseCase getRecommendationUseCase;

  Future<void> _getMovieDetails(GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit)async {
    final results = await getMovieDetailsUsecase(MovieDetailesParameter( event.id));

    results.fold((l) => emit(
        state.copyWith(
            movieDetailsState: ReqestState.error,
            movieDetailsMessage: l.message
        )
    ),
            (r) => emit(
            state.copyWith(
                movieDetails: r,
                movieDetailsState: ReqestState.Loaded
            )
        )
    );
  }

  FutureOr<void> _getRecommendetion(GetMovieRecommendetionEvent event, Emitter<MovieDetailsState> emit) async{
    final results = await getRecommendationUseCase(RecommendationParameter( event.id));

    results.fold((l) => emit(
        state.copyWith(
            recommendationState: ReqestState.error,
            recommendationMessage: l.message
        )
    ),
            (r) => emit(
            state.copyWith(
                recommendation: r,
                recommendationState: ReqestState.Loaded
            )
        )
    );
  }
}