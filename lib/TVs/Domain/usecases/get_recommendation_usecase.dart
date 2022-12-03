import 'package:clean_archticture2/TVs/Domain/entities/recommendation.dart';
import 'package:clean_archticture2/TVs/Domain/rebository/base_movies_rebository.dart';
import 'package:clean_archticture2/TVs/Domain/usecases/baseusecase.dart';
import 'package:clean_archticture2/core/erorr/fialure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetRecommendationUseCase extends BaseUsecase<List<Recommendation>,RecommendationParameter>{
  final BaseMoviesRebository baseMoviesRebository;

  GetRecommendationUseCase(this.baseMoviesRebository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameter parameters) async{
  return await baseMoviesRebository.getRecommendation(parameters);
  }


}



class RecommendationParameter extends Equatable{
  final int id;

 const RecommendationParameter(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];

}