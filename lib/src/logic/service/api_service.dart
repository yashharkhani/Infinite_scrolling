import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio =
      Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));

  Future<List<dynamic>> fetchAlbums() async {
    try {
      final response = await _dio.get('/albums');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw ApiException('Failed to fetch albums: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw ApiException('Network error while fetching albums: ${e.message}');
    }
  }

  Future<List<dynamic>> fetchPhotos(int albumId) async {
    try {
      final response =
          await _dio.get('/photos', queryParameters: {'albumId': albumId});
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw ApiException('Failed to fetch photos: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw ApiException('Network error while fetching photos: ${e.message}');
    }
  }
}

class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => message;
}
