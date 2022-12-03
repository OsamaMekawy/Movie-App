import 'package:clean_archticture2/TVs/Domain/entities/geners.dart';
import 'package:equatable/equatable.dart';

class MovieDetails extends Equatable{
  final int id;
  final String title;
  final List<Geners>geners;
  final String backdropPath;
  final int runtime;
  final String overview;
  final double voteAverage;
  final String relaseData;

 const MovieDetails( {
   required this.geners,
   required this.id,
   required this.title,
   required this.backdropPath,
   required this.runtime,
   required this.overview,
   required this.voteAverage,
   required this.relaseData,
});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    title,
    geners,
    backdropPath,
    runtime,
    overview,
    voteAverage,
    relaseData,

  ];
}