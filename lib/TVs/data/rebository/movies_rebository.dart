import 'package:clean_archticture2/TVs/Domain/entities/movie.dart';
import 'package:clean_archticture2/TVs/Domain/entities/movies_details.dart';
import 'package:clean_archticture2/TVs/Domain/entities/recommendation.dart';
import 'package:clean_archticture2/TVs/Domain/rebository/base_movies_rebository.dart';
import 'package:clean_archticture2/TVs/Domain/usecases/baseusecase.dart';
import 'package:clean_archticture2/TVs/Domain/usecases/get_recommendation_usecase.dart';
import 'package:clean_archticture2/TVs/data/datasource/movie_remote_datasource.dart';
import 'package:clean_archticture2/core/erorr/exiptions.dart';
import 'package:clean_archticture2/core/erorr/fialure.dart';
import 'package:dartz/dartz.dart';

class MovieRebository extends BaseMoviesRebository{

  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRebository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure,List<Movie>>> getNowPlaying() async {
    final results = await baseMovieRemoteDataSource.getNowPlaying();

    try{
      return Right(results);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.erorrMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPouplerMovie()async {
    final results = await baseMovieRemoteDataSource.getPouplerMovie();

    try{
      return Right(results);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.erorrMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovie() async{
    final results = await baseMovieRemoteDataSource.getTopRatedMovie();

    try{
      return Right(results);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.erorrMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetailes(MovieDetailesParameter parameter) async{
    final results = await baseMovieRemoteDataSource.getMovieDetails(parameter);

    try{
      return Right(results);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.erorrMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameter parameter)async {
    final results = await baseMovieRemoteDataSource.getRecommendation(parameter);

    try{
      return Right(results);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.erorrMessageModel.statusMessage));
    }
  }



}