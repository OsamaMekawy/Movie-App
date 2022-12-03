import 'package:clean_archticture2/TVs/Domain/usecases/baseusecase.dart';
import 'package:clean_archticture2/TVs/Domain/usecases/get_recommendation_usecase.dart';
import 'package:clean_archticture2/TVs/data/models/movie_details_model.dart';
import 'package:clean_archticture2/TVs/data/models/movie_model.dart';
import 'package:clean_archticture2/TVs/data/models/recommendation_modell.dart';

import 'package:clean_archticture2/core/erorr/exiptions.dart';
import 'package:clean_archticture2/core/network/api_constance.dart';
import 'package:clean_archticture2/core/network/erorr_message_model.dart';
import 'package:dio/dio.dart';

abstract class BaseMovieRemoteDataSource {

  Future<List<MoviesModel>>getNowPlaying();

  Future<List<MoviesModel>>getPouplerMovie();
  
  Future<List<MoviesModel>>getTopRatedMovie();

  Future<MovieDetailsModel>getMovieDetails(MovieDetailesParameter parameter);
  Future<List<RecommendationModel>>getRecommendation(RecommendationParameter parameter);

 }

class MovieRemoteDataSource extends BaseMovieRemoteDataSource{

 @override

  Future<List<MoviesModel>>getNowPlaying()async{
   final resbonce = await Dio().get(ApiConstance.nowPlayingMoviePath);
   if(resbonce.statusCode==200)
     {
       return List<MoviesModel>.from((resbonce.data["results"] as List).map((e) => MoviesModel.fromJson(e)) );
     }else{
     throw ServerException(erorrMessageModel: ErorrMessageModel.fromJson(resbonce.data));
   }

  }

  @override
  Future<List<MoviesModel>> getPouplerMovie() async{
   final resbonce  = await Dio().get(ApiConstance.pouplerMoviePath);

   if(resbonce.statusCode==200)
   {
     return List<MoviesModel>.from((resbonce.data["results"] as List).map((e) => MoviesModel.fromJson(e)) );
   }else{
     throw ServerException(erorrMessageModel: ErorrMessageModel.fromJson(resbonce.data));
   }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovie() async{
    final resbonce  = await Dio().get(ApiConstance.ReatedtopMoviePath);

    if(resbonce.statusCode==200)
    {
      return List<MoviesModel>.from((resbonce.data["results"] as List).map((e) => MoviesModel.fromJson(e)) );
    }else{
      throw ServerException(erorrMessageModel: ErorrMessageModel.fromJson(resbonce.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailesParameter parameter) async{
    final resbonce  = await Dio().get(ApiConstance.MovieDetailsPath(parameter.movieId));

    if(resbonce.statusCode==200)
    {
      return MovieDetailsModel.fromJson(resbonce.data);
    }else{
      throw ServerException(erorrMessageModel: ErorrMessageModel.fromJson(resbonce.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameter parameter) async{
    final resbonce  = await Dio().get(ApiConstance.RecommendationPath(parameter.id));

    if(resbonce.statusCode==200)
    {
      return List<RecommendationModel>.from((resbonce.data["results"] as List).map((e) => RecommendationModel.fromJson(e)) );
    }else{
      throw ServerException(erorrMessageModel: ErorrMessageModel.fromJson(resbonce.data));
    }
  }
}