import 'package:flutter/material.dart';
import 'package:rive_anim/rive_feed_emotion.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.primaries[index % Colors.primaries.length],
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Page $index",
                    style: const TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: FeedEmotionRive(),
                )
              ],
            ),
          );
        },
      )),
    );
  }
}
