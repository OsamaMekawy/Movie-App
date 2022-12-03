import 'package:clean_archticture2/TVs/Domain/entities/movies_details.dart';
import 'package:clean_archticture2/TVs/data/models/geners_model.dart';

class MovieDetailsModel extends MovieDetails{
 const MovieDetailsModel({
 required super.geners,
 required super.id,
 required super.title,
 required super.backdropPath,
 required super.runtime,
 required super.overview,
 required super.voteAverage,
 required super.relaseData
 });

 factory MovieDetailsModel.fromJson(Map<String,dynamic>json)=>
   MovieDetailsModel(
   geners: List<GenersModel>.from(json["geners"].map((x) =>GenersModel.fromJson(x))),
   id: json["id"] ,
   title: json["title"],
   backdropPath: json["backdrop_path"],
   runtime: json["runtime"],
   overview: json["overview"],
   voteAverage: json["vote_average"].toDouble(),
   relaseData: json["release_data"]
);


}