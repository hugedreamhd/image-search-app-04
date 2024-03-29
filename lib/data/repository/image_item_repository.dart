import '../data_source/pixabay_api.dart';
import '../mapper/image_mapper.dart';
import '../model/image_item.dart';

abstract interface class ImageItemRepository {
  Future<List<ImageItem>> getImageItems(String query);
}

class PixabayImageItemRepository implements ImageItemRepository {
  final _api = PixabayApi();


  @override
  Future<List<ImageItem>> getImageItems (String query) async {
    final dto = await _api.getImageResult(query);
    if(dto.hits == null) {
      return [];
    }
    return dto.hits!.map((e) => e.toImageItem()).toList();
  }
}
