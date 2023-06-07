import 'dart:async';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'cld_video.dart';


class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({super.key});

  @override
  _VideoPlayerScreenState createState() {
    return _VideoPlayerScreenState();
  }
}

// class VideoPlayerScreen extends StatefulWidget {
//   const VideoPlayerScreen({super.key});
//
//   @override
//   State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
// }

class _VideoPlayerScreenState extends State<VideoPlayerView> {
  Cloudinary cloudinary = Cloudinary.fromCloudName(cloudName: 'adimizrahi2');
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  _VideoPlayerScreenState() {

  }

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(
        cloudinary.video('dog').toString());
    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Video'),
          leading: GestureDetector(
            onTap: () {
              goBack(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 26.0,
            ),
          )),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the VideoPlayerController has finished initialization, use
            // the data it provides to limit the aspect ratio of the video.
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              // Use the VideoPlayer widget to display the video.
              child: CldVideoWidget(
                publicId: 'dog',
                videoProgressColors:
                const VideoProgressColors(playedColor: Colors.orange),
              ),
            );
          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner.
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      );
  }
  void goBack(BuildContext context) {
    Navigator.pop(context);
  }
}
