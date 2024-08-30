import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_sctreaming/models/media_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CarouselBanner extends StatelessWidget {
  const CarouselBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width,
      height: screenSize.height / 3,
      child: CarouselSlider.builder(
        itemCount: newFilms.length,
        options: CarouselOptions(
          height: screenSize.height / 3,
          autoPlay: true,
          scrollDirection: Axis.vertical,
          viewportFraction: 1.01,
        ),
        itemBuilder: (context, index, realIdx) {
          return Stack(
            children: [
              Container(
                width: screenSize.width,
                height: screenSize.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(newFilms[index].backdrop_path),
                    fit: BoxFit.cover,
                  ),
                 // borderRadius: BorderRadius.circular(8),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              ),
            ],
          );
        },
      ),
    );
  }
}
