import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:local_image_provider/local_album.dart';
import 'package:local_image_provider/local_image.dart';
import 'package:local_image_provider/local_image_provider.dart';

class GalleryState extends GetxController {
  LocalImageProvider _localImageProvider;
  bool _hasPermission;
  List<LocalImage> _images;

  Future<bool> initController() async {
    _localImageProvider = LocalImageProvider();
    _hasPermission = await _localImageProvider.initialize();
    if (_hasPermission) {
      _images = await _localImageProvider.findLatest(10000);
    }
    update();
    return true;
  }

  List<LocalImage> get images => _images;
  LocalImageProvider get localImageProvider => _localImageProvider;
}
