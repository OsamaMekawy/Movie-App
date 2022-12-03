import 'package:clean_archticture2/TVs/Domain/entities/movies_details.dart';
import 'package:clean_archticture2/TVs/Domain/entities/recommendation.dart';
import 'package:clean_archticture2/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

class MovieDetailsState extends Equatable{

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = ReqestState.Loading,
    this.movieDetailsMessage = "",
    this.recommendation = const[] ,
    this.recommendationState = ReqestState.Loading,
    this.recommendationMessage = ""
  });

  final MovieDetails? movieDetails;
  final ReqestState movieDetailsState;
  final String movieDetailsMessage;
  final List<Recommendation> recommendation;
  final ReqestState recommendationState;
  final String recommendationMessage;

  MovieDetailsState copyWith({
     MovieDetails? movieDetails,
     ReqestState? movieDetailsState,
     String?movieDetailsMessage ,
     List<Recommendation>? recommendation,
     ReqestState? recommendationState,
     String? recommendationMessage,
}){
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      recommendation: recommendation ?? this.recommendation,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationMessage: recommendationMessage ?? this.recommendationMessage

    );
  }



  @override
  // TODO: implement props
  List<Object?> get props => [movieDetails,
    movieDetailsMessage,
    movieDetailsState,
    recommendation,
    recommendationState,
    recommendationMessage
  ];
}
