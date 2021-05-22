import 'package:first_app/Models/audio.dart';
import 'package:flutter/material.dart';

class AudioContainer extends StatefulWidget {
  final Audio audio;

  AudioContainer({
    this.audio,
  });
  @override
  _AudioContainerState createState() => _AudioContainerState();
}

class _AudioContainerState extends State<AudioContainer> {
  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(
          widget.audio.image,
        ),
      ),
      title: Text(widget.audio.title),
      trailing: IconButton(
        icon: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
        ),
        onPressed: () {},
      ),
    );
  }
}
