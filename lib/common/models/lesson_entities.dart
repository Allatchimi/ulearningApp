class LessonVideoItem {
  final String? name;
  final String? url;
  final String? thumbnail;

  LessonVideoItem({this.name, this.url, this.thumbnail});
  factory LessonVideoItem.fromJson(Map<String, dynamic> json) =>
      LessonVideoItem(
        name: json["name"],
        url: json["url"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "thumbnail": thumbnail,
      };
}

class LessonVideo {
  final List<LessonVideoItem> lessonItem;
  final Future<void>? initializeVideoPlayer;
  final bool isPlay;

  LessonVideo(
      {this.lessonItem = const <LessonVideoItem>[],
      this.initializeVideoPlayer,
      this.isPlay = false});
  LessonVideo copyWith(
      {List<LessonVideoItem>? lessonItem,
      Future<void>? initializeVideoPlayer,
      bool? isPlay}) {
    return LessonVideo(
        lessonItem: lessonItem ?? this.lessonItem,
        initializeVideoPlayer:
            initializeVideoPlayer ?? this.initializeVideoPlayer,
        isPlay: isPlay ?? this.isPlay);
  }
}
