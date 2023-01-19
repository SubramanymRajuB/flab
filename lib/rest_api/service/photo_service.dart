import 'dart:async' show Future;
import 'package:flab/rest_api/models/photos_model.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<String> _loadPhotoAsset() async {
  return await rootBundle.loadString('assets/photo.json');
}

Future<List<Photo>> loadPhotos() async {
  String jsonPhotos = await _loadPhotoAsset();
  var photosList = photoFromJson(jsonPhotos);
  print("photos " + photosList[0].title);
  return photosList;
}
