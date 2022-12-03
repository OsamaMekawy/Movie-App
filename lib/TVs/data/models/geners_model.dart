import 'package:clean_archticture2/TVs/Domain/entities/geners.dart';

class GenersModel extends Geners{
 const GenersModel({required super.id, required super.name});

 factory GenersModel.fromJson(Map<String,dynamic>json)=>
GenersModel(id: json["id"], name: json["name"]);

}