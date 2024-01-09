import 'package:image_search_app_04/data/dto/pixabay_dto.dart';
import 'package:image_search_app_04/data/model/image_item.dart';

extension DtoToModel on Hits {
  ImageItem toImageItem() {
    return ImageItem(
      imageUrl: previewURL ??
          'https://cdn.pixabay.com/photo/2018/01/05/16/24/rose-3063284_150.jpg',
      tags: tags ?? '',
    );
  }
}

// import 'package:freezed annotation/freezed annotation.dart';
// import 'package:flutter/foundation.dart';
//
// part 'image_item.freezed.dart';
//
// part 'image_item_g.dart';
//
// @freezed
// class ImageItem with _$ImageItem {
//   const factory ImageItem({
//     required String tags,
//     required String imageUrl,
//     required int id,
// }) = _ImageItem;
//   factory ImageItem.fromJson(Map<String, Object?> json) =>
//       $ImageItemFormJson(json);
// }
