import 'package:flutter/material.dart';

class PhotoCarousel extends StatelessWidget {
  final int photosLength;

  const PhotoCarousel({super.key, required this.photosLength});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return SizedBox(
            width: 150,
            height: 150,
            child: Text("photo ${(index % photosLength) + 1}"));
      },
    );
  }
}
