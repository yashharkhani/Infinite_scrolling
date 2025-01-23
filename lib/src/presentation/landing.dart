import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scrolling/src/logic/cubits/album_cubit/album_cubit.dart';
import 'package:infinite_scrolling/src/logic/cubits/photo_cubit/photo_cubit.dart';
import 'package:infinite_scrolling/src/logic/service/api_service.dart';
import 'package:infinite_scrolling/src/presentation/screens/albums.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  final apiService = ApiService();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AlbumCubit(apiService)..fetchAlbums()),
        BlocProvider(create: (_) => PhotoCubit(apiService)),
      ],
      child: MaterialApp(
        title: 'Infinite Scrolling',
        home: Scaffold(
          appBar: AppBar(title: const Text('Infinite Albums')),
          body: const AlbumsWidget(),
        ),
      ),
    );
  }
}
