import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerPlayerPage extends StatefulWidget {
  const TrailerPlayerPage({super.key, required this.url});

  final String url;

  @override
  State<TrailerPlayerPage> createState() => _TrailerPlayerPageState();
}

class _TrailerPlayerPageState extends State<TrailerPlayerPage> {
  late YoutubePlayerController controller;
  bool isFirstOpen = true;

  @override
  void initState() {
    super.initState();

    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url)!,
      flags: const YoutubePlayerFlags(
        loop: false,
        autoPlay: true,
        mute: false,
      ),
    );

     controller.addListener(() {

      if (controller.value.isReady && isFirstOpen && controller.value.isFullScreen == false) {
        controller.toggleFullScreenMode();
        setState(() {
          isFirstOpen = false;
        });
      }

      if (controller.value.playerState == PlayerState.ended) {
        Future.delayed(const Duration(milliseconds: 300), () {
          if (mounted) {
            Navigator.of(context).pop();
          }
        });
      }
     });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      content: SizedBox(
        height: screenSize.height,
        width: screenSize.width,
        child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: controller,
            progressColors: ProgressBarColors(
              playedColor: Theme.of(context).primaryColor,
              handleColor: Theme.of(context).primaryColor,
            ),
          ),
          builder: (context, player) => SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                player,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
