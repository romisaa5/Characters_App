import 'package:characters_app/constants/string.dart';
import 'package:dio/dio.dart';

class CharactersApiService {
  late Dio dio;
  CharactersApiService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: Duration(seconds: 20),
      connectTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
  }
  
  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('/character');
      if (response.statusCode == 200) {
        return response.data['results']; 
      } else {
     
        return [];
      }
    } catch (e) {
     
      return [];
    }
  }
}
