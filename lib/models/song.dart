/// Song model representing a music track
class Song {
  final String id;
  final String title;
  final String artist;
  final String album;
  final int duration; // Duration in seconds
  final String source; // 'Spotify' or 'Apple Music'

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.duration,
    required this.source,
  });

  /// Convert duration in seconds to MM:SS format
  String get formattedDuration {
    final minutes = duration ~/ 60;
    final seconds = duration % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  /// Convert Song to JSON for export
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'album': album,
      'duration': formattedDuration,
      'source': source,
    };
  }

  /// Convert Song to Map for CSV/Excel export
  Map<String, dynamic> toMap() {
    return {
      'Title': title,
      'Artist': artist,
      'Album': album,
      'Duration': formattedDuration,
      'Source': source,
    };
  }

  /// Create Song from JSON
  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'],
      title: json['title'],
      artist: json['artist'],
      album: json['album'],
      duration: json['duration'],
      source: json['source'],
    );
  }
}
