import 'package:cloudinary_flutter/cloudinary_context.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:cloudinary_url_gen/transformation/delivery/delivery_actions.dart';
import 'package:cloudinary_url_gen/transformation/effect/effect.dart';
import 'package:cloudinary_url_gen/transformation/resize/resize.dart';
import 'package:cloudinary_url_gen/transformation/transformation.dart';

import 'image_model.dart';

class ImagesBuilder {
  List<ImageModel> build() {
    CloudinaryContext.cloudinary = Cloudinary.fromCloudName(cloudName: 'dus1oxlpe');
    Cloudinary cloudinary = Cloudinary.fromCloudName(cloudName: 'dus1oxlpe');
    Transformation transformation = Transformation()
     ..delivery(Quality(Quality.auto()))
     ..delivery(Format(Format.avif))
    ..resize(Resize.thumbnail()..width(500))
    ..delivery(Dpr(Dpr.auto));
    var url = cloudinary.image('tiger').transformation(transformation).toString();
    String url2 = cloudinary.image('test').transformation(Transformation()..effect(Effect.sepia(50))).toString();
    return [ImageModel(cloudinary.image('lol').toString(), 'lol', false),
      ImageModel(cloudinary.image('lol').transformation(transformation).toString(), 'lol', true),
      ImageModel(cloudinary.image('total_war_hammer').toString(), 'total_war_hammer', false),
      ImageModel(cloudinary.image('total_war_hammer').transformation(transformation).toString(), 'total_war_hammer', true),
      ImageModel(cloudinary.image('hearthstone').toString(), 'hearthstone', false),
      ImageModel(cloudinary.image('hearthstone').transformation(transformation).toString(), 'hearthstone', true),
      ImageModel(cloudinary.image('god_of_war').toString(), 'god_of_war', false),
      ImageModel(cloudinary.image('god_of_war').transformation(transformation).toString(), 'god_of_war', true),
      ImageModel(cloudinary.image('wow').toString(), 'wow', false),
      ImageModel(cloudinary.image('wow').transformation(transformation).toString(), 'wow', true),
      ImageModel(cloudinary.image('diablo').toString(), 'diablo', false),
      ImageModel(cloudinary.image('diablo').transformation(transformation).toString(), 'diablo', true),
      ImageModel(cloudinary.image('witcher').toString(), 'witcher', false),
      ImageModel(cloudinary.image('witcher').transformation(transformation).toString(), 'witcher', true),
      ImageModel(cloudinary.image('hogwarts').toString(), 'hogwarts', false),
      ImageModel(cloudinary.image('hogwarts').transformation(transformation).toString(), 'hogwarts', true),];
  }
}