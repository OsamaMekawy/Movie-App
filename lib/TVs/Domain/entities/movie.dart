import 'package:equatable/equatable.dart';

class Movie extends Equatable{
  final int id;
  final String title;
  final String backdroppath;
  final List<int> generIds;
  final String overview;
  final double Average;
  final String relaseData;
 const Movie({required this.id,
    required this.title,
    required this.backdroppath,
    required this.generIds,
    required this.overview,
    required this.Average,
    required this.relaseData
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    title,
    backdroppath,
    generIds,
    overview,
    Average,
    relaseData
  ];


}