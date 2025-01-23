import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio =
      Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));

  Future<List<dynamic>> fetchAlbums() async {
    final response = await _dio.get('/albums');
    return response.data;
  }

  Future<List<dynamic>> fetchPhotos(int albumId) async {
    final response =
        await _dio.get('/photos', queryParameters: {'albumId': albumId});
    return response.data;
  }
}
