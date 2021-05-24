class Audio {
  final String image;
  final String audioAsset;
  final String title;
  bool isPlaying;
  Audio({
    this.audioAsset,
    this.image,
    this.title,
    this.isPlaying = false,
  });
}
