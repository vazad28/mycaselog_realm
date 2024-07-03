enum MediaType { image, video }

/// photo by size size
enum ImageSize {
  thumb(300),
  medium(1280),
  original(0);

  const ImageSize(this.pixels);
  final int pixels;
}
