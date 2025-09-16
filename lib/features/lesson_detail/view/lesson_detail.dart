import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/features/lesson_detail/controller/lesson_controller.dart';
import 'package:ulearning_app/features/lesson_detail/view/widgets/lesson_detail_widgets.dart';
import 'package:video_player/video_player.dart';

class LessonDetail extends ConsumerStatefulWidget {
  const LessonDetail({super.key});

  @override
  ConsumerState<LessonDetail> createState() => _LessonDetailState();
}

class _LessonDetailState extends ConsumerState<LessonDetail> {
  late int lessonId;
  VideoPlayerController? _videoController;
  Future<void>? _initializeVideoPlayerFuture;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    lessonId = args?["id"] ?? 0;

    // Charger les vidéos dès que l'ID est disponible
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(lessonVideosControllerProvider(lessonId: lessonId).future)
          .then((videos) {
        if (videos.isNotEmpty) {
          ref.read(currentVideoStateProvider.notifier).setVideos(videos);
          ref.read(currentVideoStateProvider.notifier).setCurrentVideo(0);
        }
      });
    });
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  Future<void> _initializeVideo(String url) async {
    if (_videoController != null) {
      await _videoController!.dispose();
      setState(() {});
    }
    
    try {
      _videoController = VideoPlayerController.networkUrl(Uri.parse(url));
      
      _initializeVideoPlayerFuture = _videoController!.initialize().then((_) {
        setState(() {});
        _videoController!.play();
        ref.read(currentVideoStateProvider.notifier).setPlaying(true);
      }).catchError((error) {
        _showErrorSnackbar("Erreur de chargement vidéo");
      });
    } catch (e) {
      _showErrorSnackbar("Impossible de charger la vidéo: ${e.toString()}");
    }
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Réessayer',
          onPressed: () {
            final currentVideoUrl = ref.read(currentVideoStateProvider.notifier).currentVideoUrl;
            if (currentVideoUrl != null) {
              _initializeVideo(currentVideoUrl);
            }
          },
        ),
      )
    );
  }

  void _togglePlayPause() {
    if (_videoController != null && _videoController!.value.isInitialized) {
      if (_videoController!.value.isPlaying) {
        _videoController!.pause();
        ref.read(currentVideoStateProvider.notifier).setPlaying(false);
      } else {
        _videoController!.play();
        ref.read(currentVideoStateProvider.notifier).setPlaying(true);
      }
    }
  }

  void _navigateToVideo(int index) {
    ref.read(currentVideoStateProvider.notifier).setCurrentVideo(index);
  }

  @override
  Widget build(BuildContext context) {
    final currentVideoState = ref.watch(currentVideoStateProvider);
    final videosAsync = ref.watch(lessonVideosControllerProvider(lessonId: lessonId));
    final currentVideoUrl = ref.read(currentVideoStateProvider.notifier).currentVideoUrl;
    
    // Initialiser la vidéo quand l'URL change
    if (currentVideoUrl != null && 
        (_videoController == null || 
         _videoController!.dataSource != currentVideoUrl)) {
      _initializeVideo(currentVideoUrl);
    }

    return Scaffold(
      appBar: buildAppBar(text: "Lesson detail"),
      body: Padding(
        padding: EdgeInsets.only(top: 10.h, left: 25.w, right: 25.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Video Player Section
              _buildVideoPlayer(),
              SizedBox(height: 20.h),
              
              // Controls
              _buildVideoControls(currentVideoState),
              SizedBox(height: 20.h),
              
              // Videos List
              _buildVideosList(videosAsync),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVideoPlayer() {
    if (_videoController == null || !_videoController!.value.isInitialized) {
      return Container(
        width: 335.w,
        height: 200.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.grey[300]
        ),
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return Container(
      width: 325.w,
      height: 200.h,
      child: VideoPlayer(_videoController!),
    );
  }

  Widget _buildVideoControls(CurrentVideo videoState) {
    final hasVideos = ref.read(currentVideoStateProvider.notifier).hasVideos;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.skip_previous),
          onPressed: hasVideos ? () {
            ref.read(currentVideoStateProvider.notifier).previousVideo();
          } : null,
        ),
        SizedBox(width: 15.w),
        IconButton(
          icon: Icon(videoState.isPlaying ? Icons.pause : Icons.play_arrow),
          onPressed: hasVideos ? _togglePlayPause : null,
        ),
        SizedBox(width: 15.w),
        IconButton(
          icon: const Icon(Icons.skip_next),
          onPressed: hasVideos ? () {
            ref.read(currentVideoStateProvider.notifier).nextVideo();
          } : null,
        ),
      ],
    );
  }

  Widget _buildVideosList(AsyncValue<List<LessonVideoItem>> videosAsync) {
    return videosAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Text('Error: $error'),
      data: (videos) {
        if (videos.isEmpty) {
          return const Text("No videos available");
        }
        
        return LessonVideos(
          lessonVideoData: videos,
          onVideoTap: (video) {
            final index = videos.indexWhere((v) => v.url == video.url);
            if (index != -1) {
              _navigateToVideo(index);
            }
          },
        );
      },
    );
  }
}