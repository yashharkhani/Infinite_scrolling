import 'package:flutter/material.dart';
import 'package:infinite_scrolling/src/presentation/widgets/photo_carousel.dart';

class AlbumsWidget extends StatelessWidget {
  const AlbumsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Column(
          children: [
            Text(index.toString(), style: const TextStyle(fontSize: 18)),
            const SizedBox(
              height: 200,
              child: PhotoCarousel(
                photosLength: 10,
              ),
            ),
            const Divider(),
          ],
        );
      },
    );
  }
}
