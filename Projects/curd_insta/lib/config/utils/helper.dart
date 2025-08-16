bool isImageUrl(String url) {
  final imageExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'];
  final uri = Uri.parse(url);
  final path = uri.path.toLowerCase();
  return imageExtensions.any((ext) => path.endsWith(ext));
}

bool isVideoUrl(String url) {
  final videoExtensions = ['mp4', 'mov', 'avi', 'mkv', 'webm'];
  final uri = Uri.parse(url);
  final path = uri.path.toLowerCase();
  return videoExtensions.any((ext) => path.endsWith(ext));
}
