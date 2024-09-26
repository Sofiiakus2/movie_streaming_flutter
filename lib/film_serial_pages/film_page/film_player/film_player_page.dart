import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_sctreaming/models/media_model.dart';
import 'package:video_player/video_player.dart';

class FilmPlayerPage extends StatefulWidget {
  const FilmPlayerPage({super.key, required this.film});
  final MediaModel film;

  @override
  State<FilmPlayerPage> createState() => _FilmPlayerPageState();
}

class _FilmPlayerPageState extends State<FilmPlayerPage> {
  late VideoPlayerController videoPlayerController;
  bool showControls = true;
  bool isPlaying = false;
  Duration videoLength = Duration.zero;
  Duration currentPosition = Duration.zero;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    Uri url = Uri.parse(widget.film.videoUrl);
    videoPlayerController = VideoPlayerController.networkUrl(url)
      ..initialize().then((_) {
        setState(() {
          videoLength = videoPlayerController.value.duration;
        });
        videoPlayerController.play();
        isPlaying = false;
        videoPlayerController.addListener(() {
          setState(() {
            currentPosition = videoPlayerController.value.position;
          });
        });
      });

    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        showControls = false;
      });
    });
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            showControls = !showControls;
          });
          Future.delayed(const Duration(seconds: 1000), () {
            setState(() {
              showControls = false;
            });
          });
        },
        child: Stack(
          children: [
            Center(
              child: videoPlayerController.value.isInitialized
                  ? AspectRatio(
                  aspectRatio: videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(videoPlayerController))
                  : Container(),
            ),
            if (showControls)
              Stack(
                children: [
                  Positioned(
                    bottom: 15,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              isPlaying
                                  ? videoPlayerController.pause()
                                  : videoPlayerController.play();
                              isPlaying = !isPlaying;
                            });
                          },
                        ),
                        Expanded(
                          child: Slider(
                            value: currentPosition.inSeconds.toDouble(),
                            min: 0.0,
                            max: videoLength.inSeconds.toDouble(),
                            onChanged: (value) {
                              setState(() {
                                videoPlayerController.seekTo(
                                  Duration(seconds: value.toInt()),
                                );
                              });
                            },
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                          onPressed: () {

                          },
                        ),
                      ],
                    ),
                  ),


                ],
              ),
          ],
        ),
      ),
    );
  }
}
