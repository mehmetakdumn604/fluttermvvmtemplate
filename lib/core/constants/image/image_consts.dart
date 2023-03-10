

import 'package:fluttermvvmtemplate/core/constants/app/app_constants.dart';

class ImageConstants {

  ImageConstants._init();
  static ImageConstants? _instance;

  static ImageConstants get instance => _instance ??= ImageConstants._init();

  String get logo => toImage('logo');

  // String get hotDog => toImage('hotdogs');
  // String get projeIcon => toImage('cirlce_hwa');

  String toImage(String name, {ImageType imageType = ImageType.png}) => '${AppConstans.IMAGE_ASSET_PATH}$name.${imageType.name}';


}

enum ImageType {
  png,
  jpeg,
  svg
}