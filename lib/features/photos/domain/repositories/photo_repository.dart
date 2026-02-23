import '../entities/photo_model.dart';

abstract class PhotoRepository {
  Future<List<PhotoModel>> getPhotos({int limit = 50, int offset = 0});
}
