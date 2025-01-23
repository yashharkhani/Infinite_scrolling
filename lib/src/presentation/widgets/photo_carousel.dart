import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scrolling/src/logic/cubits/photo_cubit/photo_cubit.dart';
import 'package:infinite_scrolling/src/logic/models/photo_model.dart';

class PhotoCarousel extends StatelessWidget {
  final int albumId;

  const PhotoCarousel({super.key, required this.albumId});

  @override
  Widget build(BuildContext context) {
    context.read<PhotoCubit>().fetchPhotos(albumId);

    return BlocBuilder<PhotoCubit, Map<int, List<Photo>>>(
      builder: (context, photoMap) {
        final photos = photoMap[albumId] ?? [];
        if (photos.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final photo = photos[index % photos.length];

            /// Note: the jsonplaceholder API does not return the actual image
            /// Thus, the below code will not work as expected.
            /// The CachedNetworkImage will take care of displaying the actual image and caching it

            // return CachedNetworkImage(
            //   imageUrl: photo.url,
            //   width: 150,
            //   height: 150,
            // );
            return SizedBox(
                width: 150,
                height: 150,
                child: Text(
                    "photo ${(index % photos.length) + 1} \n ${photo.url}"));
          },
        );
      },
    );
  }
}
