import 'package:equatable/equatable.dart';

abstract class MovieDetailsEvent extends Equatable{
 const MovieDetailsEvent();
}

class GetMovieDetailsEvent extends MovieDetailsEvent{
  final int id;

 const GetMovieDetailsEvent(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}



class GetMovieRecommendetionEvent extends MovieDetailsEvent{
  final int id;

  const GetMovieRecommendetionEvent(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}