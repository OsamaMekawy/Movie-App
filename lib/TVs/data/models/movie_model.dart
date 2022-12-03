import 'package:clean_archticture2/TVs/Domain/entities/movie.dart';

class MoviesModel extends Movie{
const  MoviesModel({
  required super.id,
  required super.title,
  required super.backdroppath,
  required super.generIds,
  required super.overview,
  required super.Average,
  required super.relaseData
  });

  factory MoviesModel.fromJson (Map<String,dynamic> json)=>MoviesModel(
id: json["id"],
title: json["title"],
backdroppath: json["backdrop_path"],
generIds: List<int> .from(json["genre_ids"].map((e)=>e)),
overview: json["overview"],
Average: json["vote_average"].toDouble(),
relaseData: json["release_date" ]
);




}