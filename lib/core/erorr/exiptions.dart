import 'package:clean_archticture2/core/network/erorr_message_model.dart';

class ServerException implements Exception{
  final ErorrMessageModel erorrMessageModel;

 const ServerException({required this.erorrMessageModel});

}