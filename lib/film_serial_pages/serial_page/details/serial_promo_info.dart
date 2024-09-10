
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../models/genre_model.dart';
import '../../../services/user_service.dart';
import '../../trailer_player_page/trailer_player_page.dart';
import '../serial_page.dart';

class SerialPromoInfo extends StatelessWidget {
  const SerialPromoInfo({
    super.key,
    required this.widget,
  });

  final SerialPage widget;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Positioned(
      bottom: 10,
      left: 30,
      right: 30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: screenSize.width/1.5,
                child: Text(widget.serial.title,
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ),
              Text(widget.serial.age,
                style: TextStyle(
                    fontWeight: Theme.of(context).textTheme.titleLarge?.fontWeight,
                    fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                    color: Theme.of(context).primaryColor
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(GenreModel.getGenreNames(widget.serial.genres),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text('${widget.serial.release_date.year}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          SizedBox(
            width: screenSize.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 160,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            // showDialog(
                            //   context: context,
                            //   builder: (BuildContext context) {
                            //     return TrailerPlayerPage(url: widget.serial.trailer_url);
                            //   },
                            // );
                            // Add functionality here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.play_circle_outline,
                                color: Colors.white,
                                size: 30,
                              ),
                              Text(
                                AppLocalizations.of(context)!.watch,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: FutureBuilder<bool>(
                      future: UserService.isInWatchlist(widget.serial.id),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return const Icon(Icons.error, color: Colors.red);
                        }
                        bool isInWatchlist = snapshot.data ?? false;
                        return Row(
                          children: [
                            SizedBox(
                              width: 160,
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () {
                                  if(isInWatchlist){
                                    UserService.removeFromWatchlist(widget.serial);
                                  }else{
                                    UserService.addToWatchlist(widget.serial);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context).dialogBackgroundColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      isInWatchlist ? Icons.remove_circle_outline : Icons.add_circle_outline,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    Text(
                                      isInWatchlist
                                          ? AppLocalizations.of(context)!.delete
                                          : AppLocalizations.of(context)!.save,
                                      style: Theme.of(context).textTheme.titleSmall,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
