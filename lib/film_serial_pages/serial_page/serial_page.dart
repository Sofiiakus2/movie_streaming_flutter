import 'package:flutter/material.dart';
import 'package:movie_sctreaming/models/season_model.dart';
import '../../models/media_model.dart';
import '../trailer_player_page/trailer_player_page.dart';
import 'details/season_view.dart';
import 'details/serial_promo_info.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SerialPage extends StatefulWidget {
  const SerialPage({super.key, required this.serial});
  final MediaModel serial;

  @override
  State<SerialPage> createState() => _SerialPageState();
}

class _SerialPageState extends State<SerialPage> {

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    List<SeasonModel>? seasons = widget.serial.seasons;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: screenSize.width,
              height: screenSize.height / 1.7,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      widget.serial.postersUrl[0],
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Container(
                    width: screenSize.width,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black,
                          Colors.transparent,
                        ],
                        stops: [0.0, 1.0],
                      ),
                    ),
                  ),

                  SerialPromoInfo(serial: widget.serial),
                  Center(
                      child: IconButton(
                        icon: const Icon(
                          Icons.play_arrow,
                          size: 100,
                        ),
                        onPressed: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return TrailerPlayerPage(url: widget.serial.trailerUrl);
                            },
                          );
                        },
                      )
                  ),
                  Positioned(
                      top: 10,
                      right: 10,
                      child: IconButton(
                        icon: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {  },
                      )),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('${AppLocalizations.of(context)!.rating}: ${widget.serial.voteAverage.toString()}', style: Theme.of(context).textTheme.titleMedium),
                Text('${AppLocalizations.of(context)!.votes}: ${widget.serial.voteCount.toString()}', style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    widget.serial.overview,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            SeasonView(serial: widget.serial,),

          ],
        ),
      ),
    );
  }
}

