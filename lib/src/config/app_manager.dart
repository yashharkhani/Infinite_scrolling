import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:infinite_scrolling/src/logic/models/album_model.dart';
import 'package:infinite_scrolling/src/logic/models/photo_model.dart';
import 'package:path_provider/path_provider.dart';

class AppManager {
  Future initStorage() async {
    Directory storage =
        kIsWeb ? Directory("") : await getApplicationDocumentsDirectory();

    Hive.init(storage.path);

    Hive.registerAdapter(AlbumAdapter());
    Hive.registerAdapter(PhotoAdapter());
  }
}
