import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'next_page.dart';

class VideoPage extends StatelessWidget {
  final controller = VideoPlayerController.network(
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VideoPage'),
        actions: [
          ElevatedButton(
            child: const Text('play'),
            onPressed: () {
              controller.value.isPlaying ? controller.pause() : controller.play();
            },
          ),
          ElevatedButton(
            child: const Text('next'),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return NextPage();
              }));
            },
          ),
        ],
      ),
      body: Center(
        child: _BumbleBeeRemoteVideo(controller),
      ),
    );
  }
}

class _BumbleBeeRemoteVideo extends StatefulWidget {
  const _BumbleBeeRemoteVideo(this.controller);

  final VideoPlayerController controller;

  @override
  _BumbleBeeRemoteVideoState createState() => _BumbleBeeRemoteVideoState();
}

class _BumbleBeeRemoteVideoState extends State<_BumbleBeeRemoteVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(padding: const EdgeInsets.only(top: 20.0)),
          const Text('With remote mp4'),
          Container(
            padding: const EdgeInsets.all(20),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller),
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
