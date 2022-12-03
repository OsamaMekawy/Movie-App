import 'package:clean_archticture2/TVs/Domain/entities/movie.dart';
import 'package:clean_archticture2/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

class MoviesState extends Equatable{

  final List<Movie> nowPlayingMovies;
  final ReqestState nowPlayingState;
  final String nowPlayingMessage ;
  final List<Movie> pouplerMovies;
  final ReqestState pouplerState;
  final String pouplerMessage ;
  final List<Movie> topReatedMovies;
  final ReqestState topReatedState;
  final String topReatedMessage ;

  const MoviesState({
     this.nowPlayingMovies = const [],
     this.nowPlayingState = ReqestState.Loading,
    this.nowPlayingMessage = '',
    this.pouplerMovies = const [],
    this.pouplerState = ReqestState.Loading,
    this.pouplerMessage = '',
    this.topReatedMovies = const [],
    this.topReatedState = ReqestState.Loading,
    this.topReatedMessage = '',

});

  MoviesState copyWith({
     List<Movie>? nowPlayingMovies,
     ReqestState? nowPlayingState,
     String? nowPlayingMessage ,
     List<Movie>? pouplerMovies,
     ReqestState? pouplerState,
     String? pouplerMessage,
      List<Movie>? topReatedMovies,
      ReqestState? topReatedState,
      String? topReatedMessage ,
}){
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
        pouplerMovies: pouplerMovies ?? this.pouplerMovies,
        pouplerState: pouplerState ?? this.pouplerState,
        pouplerMessage: pouplerMessage ?? this.pouplerMessage,
        topReatedMovies: topReatedMovies ?? this.topReatedMovies,
      topReatedState: topReatedState ?? this.topReatedState,
      topReatedMessage: topReatedMessage ?? this.topReatedMessage

    );
}

  @override
  // TODO: implement props
  List<Object?> get props => [nowPlayingMovies,
    nowPlayingState,
    nowPlayingMessage,
    pouplerMovies,
    pouplerState,
    pouplerMessage,
    topReatedMovies,
    topReatedState,
    topReatedMessage
  ];

}