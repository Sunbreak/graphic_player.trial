import 'package:flutter/material.dart';

import 'video_page.dart';

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NextPage'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('VideoPage'),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return VideoPage();
            }));
          },
        ),
      ),
    );
  }
}
