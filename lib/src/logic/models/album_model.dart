import 'package:hive/hive.dart';

part 'album_model.g.dart';

@HiveType(typeId: 0)
class Album {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;

  Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}
