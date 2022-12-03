import 'package:clean_archticture2/core/erorr/fialure.dart';
import 'package:dartz/dartz.dart';

import '../entities/movie.dart';
import '../rebository/base_movies_rebository.dart';

class GetNowPouplerMovies{
  final BaseMoviesRebository baseMoviesRebository;

  GetNowPouplerMovies(this.baseMoviesRebository);



  Future<Either<Failure,List<Movie>>>execute() async{
    return await baseMoviesRebository.getPouplerMovie();
  }
}