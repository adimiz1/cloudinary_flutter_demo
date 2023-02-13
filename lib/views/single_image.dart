import 'dart:io';

import 'package:cloudinary_dart/cloudinary.dart';
import 'package:cloudinary_dart/transformation/adjust/adjust.dart';
import 'package:cloudinary_dart/transformation/delivery/delivery_actions.dart';
import 'package:cloudinary_dart/transformation/effect/effect.dart';
import 'package:cloudinary_dart/transformation/effect/effect_actions.dart';
import 'package:cloudinary_dart/transformation/gravity/gravity.dart';
import 'package:cloudinary_dart/transformation/resize/resize.dart';
import 'package:cloudinary_dart/transformation/rotate.dart';
import 'package:cloudinary_dart/transformation/round_corners.dart';
import 'package:cloudinary_dart/transformation/transformation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conference_demo/views/cld_image.dart';

import '../utils/downloader.dart';

class SingleImage extends StatefulWidget {
  String publicId = "";

  SingleImage(this.publicId, {super.key});

  @override
  _StatefulWidgetSingleImageState createState() {
    return _StatefulWidgetSingleImageState(publicId);
  }
}

class _StatefulWidgetSingleImageState extends State<SingleImage> {
  Cloudinary myCloudinaryObject =
      Cloudinary.fromCloudName(cloudName: "adimizrahi2");
  String url = "";
  String publicId = "";
  String _fileSize = "";

  _StatefulWidgetSingleImageState(this.publicId) {
    initCloudinary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.publicId),
          leading: GestureDetector(
            onTap: () {
              goBack(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 26.0,
            ),
          )),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: FractionallySizedBox(
                alignment: Alignment.center,
                widthFactor: 0.7,
                child: Column(
                  children: [
                    CldImageWidget(
                        publicId: publicId,
                        transformation: getTransformation()),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: FutureBuilder<String>(
                            future: getTransformedFileSize(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data!,
                                  style: const TextStyle(
                                      color: Color(0xFF3448C5),
                                      fontWeight: FontWeight.w600),
                                );
                              } else {
                                return const Text(
                                  "Calculating...",
                                  style: TextStyle(
                                      color: Color(0xFF3448C5),
                                      fontWeight: FontWeight.w600),
                                );
                              }
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            FractionallySizedBox(
              alignment: Alignment.center,
              widthFactor: 0.7,
              child: Column(
                children: [
                  Image.network(url),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        _fileSize,
                        style: const TextStyle(
                            color: Color(0xFF535f7a),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  void initCloudinary() {
    url = (myCloudinaryObject.image(publicId)).toString();

    //Calculate sizes
    Downloader().getFileSize(url).then((val) => setState(() {
          _fileSize = val;
        }));
  }

  Transformation getTransformation() {
    return Transformation()
         ..resize(Resize.crop()..width(800)..height(800)
        ..gravity(Gravity.autoGravity()))
     // ..roundCorners(RoundCorners.max());
    // ..effect(Effect.sepia());
    //  ..effect(Effect.artisticFilter(ArtisticFilter.hokusai()));
     ..adjust(Adjust.improve());
  }

  Future<String> getTransformedFileSize() async {
    String transformedUrl = myCloudinaryObject
        .image(publicId)
        .transformation(getTransformation())
        .toString();
    return await Downloader().getFileSize(transformedUrl);
  }
}
