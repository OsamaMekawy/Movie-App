import 'package:clean_archticture2/TVs/Domain/entities/movie.dart';
import 'package:clean_archticture2/TVs/Domain/rebository/base_movies_rebository.dart';
import 'package:clean_archticture2/core/erorr/fialure.dart';
import 'package:dartz/dartz.dart';

class GetNowPlayingMovies{
  final BaseMoviesRebository baseMoviesRebository;

  GetNowPlayingMovies(this.baseMoviesRebository);

  Future<Either<Failure,List<Movie>>>execute() async{
    return await baseMoviesRebository.getNowPlaying();
  }
}