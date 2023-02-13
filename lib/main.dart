import 'package:flutter/material.dart';
import 'package:flutter_conference_demo/Models/image_model.dart';
import 'package:flutter_conference_demo/Models/images_builder.dart';
import 'package:flutter_conference_demo/views/image_card.dart';
import 'package:flutter_conference_demo/views/video_player_view.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // FormatBuilder.setFormatBasedOnOperatingSystem();
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(title: 'Images Feed'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions:  [Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {goToVideoScreen();},
              child: const Icon(
                Icons.ondemand_video,
                size: 26.0,
              ),
            )
        ),],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: GridView.builder(
          padding: const EdgeInsets.only(left:12, top: 24, right: 12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,

            mainAxisSpacing: 0,
          ),
          // return a custom ItemCard
          itemBuilder: (context, i) => ImageCard(getItems()[i]),
          itemCount: getItems().length,
        ),
      ),
    );
  }

  void goToVideoScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const VideoPlayerView()),
    );
  }

  List<ImageModel> getItems() {
    return ImagesBuilder().build();
  }
}
