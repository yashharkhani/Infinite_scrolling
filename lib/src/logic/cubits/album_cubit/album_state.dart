part of 'album_cubit.dart';

sealed class AlbumState extends Equatable {
  const AlbumState();

  @override
  List<Object> get props => [];
}

final class AlbumInitialState extends AlbumState {}

final class AlbumsLoadedState extends AlbumState {
  final List<Album> albums;

  const AlbumsLoadedState(this.albums);

  @override
  List<Object> get props => [albums];
}

final class AlbumsErrorState extends AlbumState {
  final String message;

  const AlbumsErrorState(this.message);

  @override
  List<Object> get props => [message];
}
