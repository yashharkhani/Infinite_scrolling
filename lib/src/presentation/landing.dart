import 'package:flutter/material.dart';
import 'package:infinite_scrolling/src/presentation/screens/albums.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infinite Scrolling',
      home: Scaffold(
        appBar: AppBar(title: const Text('Infinite Albums')),
        body: const AlbumsWidget(),
      ),
    );
  }
}
