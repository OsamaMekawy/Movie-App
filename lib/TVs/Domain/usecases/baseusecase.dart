import 'package:clean_archticture2/core/erorr/fialure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class BaseUsecase<T,Parameters>{
  Future<Either<Failure,T>>call(Parameters parameters);
}


class NoParameters extends Equatable{
  const NoParameters();

  @override
  // TODO: implement props
  List<Object?> get props => [];

}


class MovieDetailesParameter extends Equatable{

  final int movieId;

  @override
 const MovieDetailesParameter(this.movieId);

  List<Object?> get props => [movieId];

}