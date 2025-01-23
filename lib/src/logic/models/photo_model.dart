import 'package:hive/hive.dart';

part 'photo_model.g.dart';

@HiveType(typeId: 1)
class Photo {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String url;

  Photo({required this.id, required this.url});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      url: json['url'],
    );
  }
}
