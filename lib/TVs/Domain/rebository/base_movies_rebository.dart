import 'package:clean_archticture2/TVs/Domain/entities/movie.dart';
import 'package:clean_archticture2/TVs/Domain/entities/movies_details.dart';
import 'package:clean_archticture2/TVs/Domain/entities/recommendation.dart';
import 'package:clean_archticture2/TVs/Domain/usecases/baseusecase.dart';
import 'package:clean_archticture2/TVs/Domain/usecases/get_recommendation_usecase.dart';
import 'package:clean_archticture2/core/erorr/fialure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseMoviesRebository{

  Future<Either<Failure,List<Movie>>> getNowPlaying();

  Future<Either<Failure,List<Movie>>> getPouplerMovie();

  Future<Either<Failure,List<Movie>>> getTopRatedMovie();

  Future<Either<Failure,MovieDetails>> getMovieDetailes(MovieDetailesParameter parameter);

  Future<Either<Failure,List<Recommendation>>> getRecommendation(
      RecommendationParameter parameter
      );
}