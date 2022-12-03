import 'package:clean_archticture2/TVs/Domain/entities/movies_details.dart';
import 'package:clean_archticture2/TVs/Domain/rebository/base_movies_rebository.dart';
import 'package:clean_archticture2/TVs/Domain/usecases/baseusecase.dart';
import 'package:clean_archticture2/core/erorr/fialure.dart';
import 'package:dartz/dartz.dart';

class GetMovieDetailsUsecase extends BaseUsecase<MovieDetails,MovieDetailesParameter>{
  final BaseMoviesRebository baseMoviesRebository;

  GetMovieDetailsUsecase(this.baseMoviesRebository);

  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailesParameter parameters) async{

   return await baseMoviesRebository.getMovieDetailes(parameters);
  }

}