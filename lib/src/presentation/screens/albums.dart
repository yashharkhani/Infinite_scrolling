import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scrolling/src/logic/cubits/album_cubit/album_cubit.dart';
import 'package:infinite_scrolling/src/presentation/widgets/photo_carousel.dart';

class AlbumsWidget extends StatelessWidget {
  const AlbumsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumCubit, AlbumState>(
      builder: (context, state) {
        if (state is AlbumInitialState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is AlbumsLoadedState) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final album = state.albums[index % state.albums.length];
              return Column(
                children: [
                  Text(album.title, style: const TextStyle(fontSize: 18)),
                  SizedBox(
                    height: 200,
                    child: PhotoCarousel(albumId: album.id),
                  ),
                  const Divider(),
                ],
              );
            },
          );
        }

        return const Center(child: Text("Failed to load albums"));
      },
    );
  }
}
