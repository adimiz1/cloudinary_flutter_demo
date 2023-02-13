import 'package:cloudinary_dart/cloudinary.dart';
import 'package:cloudinary_dart/transformation/adjust/adjust.dart';
import 'package:cloudinary_dart/transformation/delivery/delivery_actions.dart';
import 'package:cloudinary_dart/transformation/effect/effect.dart';
import 'package:cloudinary_dart/transformation/resize/resize.dart';
import 'package:cloudinary_dart/transformation/transformation.dart';

import 'image_model.dart';

class ImagesBuilder {
  List<ImageModel> build() {
    Cloudinary cloudinary = Cloudinary.fromCloudName(cloudName: 'adimizrahi2');
    Transformation transformation = Transformation()
     ..delivery(Quality(Quality.auto()))
     ..delivery(Format(Format.avif))
    ..resize(Resize.thumbnail()..width(500))
    ..delivery(Dpr(Dpr.auto));
    // ..resize(Resize.thumbnail()..width(500));
    // ..delivery(Dpr(Dpr.auto));
    var url = cloudinary.image('tiger').transformation(transformation).toString();
    return [ImageModel(cloudinary.image('tiger').toString(), 'tiger', false),
      ImageModel(cloudinary.image('tiger').transformation(transformation).toString(), 'tiger', true),
      ImageModel(cloudinary.image('lion').toString(), 'lion', false),
      ImageModel(cloudinary.image('lion').transformation(transformation).toString(), 'lion', true),
      ImageModel(cloudinary.image('rabbit').toString(), 'rabbit', false),
      ImageModel(cloudinary.image('rabbit').transformation(transformation).toString(), 'rabbit', true),
      ImageModel(cloudinary.image('dogs').toString(), 'dogs', false),
      ImageModel(cloudinary.image('dogs').transformation(transformation).toString(), 'dogs', true),
      ImageModel(cloudinary.image('cats').toString(), 'cats', false),
      ImageModel(cloudinary.image('cats').transformation(transformation).toString(), 'cats', true),
      ImageModel(cloudinary.image('bird').toString(), 'bird', false),
      ImageModel(cloudinary.image('bird').transformation(transformation).toString(), 'bird', true),
      ImageModel(cloudinary.image('dog_in_cup').toString(), 'dog_in_cup', false),
      ImageModel(cloudinary.image('dog_in_cup').transformation(transformation).toString(), 'dog_in_cup', true),
      ImageModel(cloudinary.image('fox').toString(), 'fox', false),
      ImageModel(cloudinary.image('fox').transformation(transformation).toString(), 'fox', true),];
  }
}