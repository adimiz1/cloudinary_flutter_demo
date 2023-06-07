import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloudinary_flutter/image/cld_image.dart';
import 'package:cloudinary_url_gen/asset/cld_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conference_demo/views/single_image.dart';

import '../Models/image_model.dart';

class ImageCard extends StatefulWidget {
  final ImageModel model;

  const ImageCard(this.model, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _StatefulWidgetImageCardState(model);
  }
}

class _StatefulWidgetImageCardState extends State<ImageCard> {
  String _fileSize = "";

  _StatefulWidgetImageCardState(ImageModel model) {
    model.getSize().then((val) => setState(() {
          _fileSize = val;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            goToSingleImage(widget.model.publicId);
          },
          child: Card(elevation: 4.0, child: CldImageWidget(publicId: widget.model.publicId, ),),

        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              _fileSize,
              style: TextStyle(color: getTextColor(widget.model.isTransformed), fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }

  void goToSingleImage(String url) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SingleImage(url)),
    );
  }

  Color getTextColor(bool isTransformed) {
    if (isTransformed) {
      return const Color(0xFF3448C5);
    }
    return const Color(0xFF535f7a);
  }
}
