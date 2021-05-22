import 'package:first_app/Models/audio.dart';
import 'package:flutter/material.dart';

class AudioContainer extends StatefulWidget {
  final Audio audio;
  final Color color;
  final Function startPlaying;

  AudioContainer({
    this.audio,
    this.color,
    this.startPlaying,
  });
  @override
  _AudioContainerState createState() => _AudioContainerState();
}

class _AudioContainerState extends State<AudioContainer> {
  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: widget.color,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            vertical: 5,
          ),
          leading: CircleAvatar(
            maxRadius: 40,
            backgroundImage: AssetImage(
              widget.audio.image,
            ),
          ),
          title: Text(
            widget.audio.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          trailing: Padding(
            padding: EdgeInsets.only(
              right: 10,
            ),
            child: IconButton(
              icon: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  isPlaying = !isPlaying;
                });
                widget.startPlaying();
              },
            ),
          ),
        ),
      ),
    );
  }
}
