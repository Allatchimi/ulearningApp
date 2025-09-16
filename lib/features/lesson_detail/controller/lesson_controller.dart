import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/features/lesson_detail/repo/lesson_repo.dart';

part 'lesson_controller.g.dart';

@riverpod
Future<List<LessonVideoItem>> lessonVideosController(
  LessonVideosControllerRef ref, {
  required int lessonId,
}) async {
  try {
    final videos = await LessonRepo.getLessonVideos(id: lessonId);
    return videos;
  } catch (e) {
    rethrow;
  }
}

@riverpod
class CurrentVideoState extends _$CurrentVideoState {
  @override
  CurrentVideo build() {
    return CurrentVideo(
      currentVideoIndex: 0,
      isPlaying: false,
      videoList: [],
    );
  }

  String? get currentVideoUrl {
    if (state.currentVideoIndex < state.videoList.length) {
      return state.videoList[state.currentVideoIndex].fullUrl;
    }
    return null;
  }

  void setVideos(List<LessonVideoItem> videos) {
    state = state.copyWith(videoList: videos);
  }

  void setCurrentVideo(int index) {
    if (index >= 0 && index < state.videoList.length) {
      state = state.copyWith(currentVideoIndex: index);
    }
  }

  void setPlaying(bool playing) {
    state = state.copyWith(isPlaying: playing);
  }

  void nextVideo() {
    final nextIndex = (state.currentVideoIndex + 1) % state.videoList.length;
    setCurrentVideo(nextIndex);
  }

  void previousVideo() {
    final prevIndex = (state.currentVideoIndex - 1) % state.videoList.length;
    setCurrentVideo(prevIndex < 0 ? state.videoList.length - 1 : prevIndex);
  }

  bool get hasVideos => state.videoList.isNotEmpty;
}

class CurrentVideo {
  final int currentVideoIndex;
  final bool isPlaying;
  final List<LessonVideoItem> videoList;

  CurrentVideo({
    required this.currentVideoIndex,
    required this.isPlaying,
    required this.videoList,
  });

  CurrentVideo copyWith({
    int? currentVideoIndex,
    bool? isPlaying,
    List<LessonVideoItem>? videoList,
  }) {
    return CurrentVideo(
      currentVideoIndex: currentVideoIndex ?? this.currentVideoIndex,
      isPlaying: isPlaying ?? this.isPlaying,
      videoList: videoList ?? this.videoList,
    );
  }
}
