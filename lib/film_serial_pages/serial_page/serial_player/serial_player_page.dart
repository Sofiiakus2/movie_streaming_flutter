import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_sctreaming/models/season_model.dart';
import 'package:movie_sctreaming/models/series_model.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SerialPlayerPage extends StatefulWidget {
  const SerialPlayerPage({super.key, required this.season, required this.seria});
  final SeasonModel season;
  final SeriesModel seria;

  @override
  State<SerialPlayerPage> createState() => _SerialPlayerPageState();
}

class _SerialPlayerPageState extends State<SerialPlayerPage> {
  late VideoPlayerController videoPlayerController;
  bool showControls = true;
  bool isPlaying = false;
  bool isAllSeriesShow = false;
  Duration videoLength = Duration.zero;
  Duration currentPosition = Duration.zero;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    Uri url = Uri.parse(widget.seria.videoUrl);
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
                    top: 20,
                      right: isAllSeriesShow ? 220 : 20,
                      child: IconButton(
                          onPressed: (){
                            setState(() {
                              isAllSeriesShow = !isAllSeriesShow;
                            });
                          },
                          icon: Icon(
                            isAllSeriesShow
                              ? Icons.arrow_forward_ios
                              : Icons.arrow_back_ios,
                            color: Theme.of(context).primaryColor,)
                      )
                  ),
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
                  isAllSeriesShow
                      ? Positioned(
                    right: 20,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 350.0,
                          width: 200,
                          child: ListView.builder(
                            itemCount: widget.season.seriesCount,
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    width: 200,
                                    height: 100,
                                    child: Image.network(
                                      widget.season.series[index].posterUrl,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    child: Container(
                                      color: Colors.white70,
                                      child: Text(
                                            widget.season.series[index].name,
                                          style: Theme.of(context).textTheme.labelMedium,
                                        ),
                                    ),

                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )
                      : Positioned(
                    right: 30,
                    bottom: 60,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        color: Colors.white70,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2.0,
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.next,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Icon(
                              Icons.navigate_next,
                              color: Theme.of(context).primaryColor,
                            )
                          ],
                        ),
                      ),
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
