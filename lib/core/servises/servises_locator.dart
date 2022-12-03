import 'package:clean_archticture2/TVs/Domain/rebository/base_movies_rebository.dart';

import 'package:clean_archticture2/TVs/Domain/usecases/get_movie_details.dart';
import 'package:clean_archticture2/TVs/Domain/usecases/get_now_playing_movis.dart';
import 'package:clean_archticture2/TVs/Domain/usecases/get_poupler_movis.dart';
import 'package:clean_archticture2/TVs/Domain/usecases/get_recommendation_usecase.dart';
import 'package:clean_archticture2/TVs/Domain/usecases/get_top_reated_movis.dart';
import 'package:clean_archticture2/TVs/data/datasource/movie_remote_datasource.dart';
import 'package:clean_archticture2/TVs/data/rebository/movies_rebository.dart';
import 'package:clean_archticture2/TVs/presentation/controller/movie_details_bloc.dart';
import 'package:clean_archticture2/TVs/presentation/controller/movies_bloc.dart';

import 'package:get_it/get_it.dart';


final sl = GetIt.instance;

class ServicesLocator{
  void init(){

    /// Bloc

    sl.registerFactory(() => MoviesBloc(sl(),sl(),sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));

    /// Data Source
  sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());

   /// Rebository
  sl.registerLazySingleton<BaseMoviesRebository>(() => MovieRebository(sl()));

  /// Use Cases

    sl.registerLazySingleton(() => GetNowPlayingMovies(sl()));
    sl.registerLazySingleton(() => GetNowPouplerMovies(sl()));
    sl.registerLazySingleton(() => GetNowTopReatedMovies(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUsecase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));


  }
}