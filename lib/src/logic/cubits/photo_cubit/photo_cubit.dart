import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scrolling/src/logic/models/photo_model.dart';
import 'package:infinite_scrolling/src/logic/service/api_service.dart';

class PhotoCubit extends Cubit<Map<int, List<Photo>>> {
  final ApiService apiService;

  PhotoCubit(this.apiService) : super({});

  void fetchPhotos(int albumId) async {
    final photoData = await apiService.fetchPhotos(albumId);
    final photos = photoData.map((e) => Photo.fromJson(e)).toList();

    //As we need to retain the previous state, we need to emit the previous state along with the new state
    //Thus I am using the spread operator to emit the previous state along with the new state and not updating the state directly
    emit({...state, albumId: photos});
  }
}
