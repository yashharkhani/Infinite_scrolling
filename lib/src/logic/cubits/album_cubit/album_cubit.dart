import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:infinite_scrolling/src/logic/models/album_model.dart';
import 'package:infinite_scrolling/src/logic/service/api_service.dart';

part 'album_state.dart';

class AlbumCubit extends Cubit<AlbumState> {
  final ApiService apiService;

  AlbumCubit(this.apiService) : super(AlbumInitialState());

  void fetchAlbums() async {
    final box = await Hive.openBox<Album>('albums');
    if (box.isNotEmpty) {
      emit(AlbumsLoadedState(box.values.toList()));
    } else {
      try {
        final albumData = await apiService.fetchAlbums();
        final albums = albumData.map((e) => Album.fromJson(e)).toList();
        box.addAll(albums);
        emit(AlbumsLoadedState(albums));
      } catch (e) {
        emit(AlbumsErrorState(e.toString()));
      }
    }
  }
}
