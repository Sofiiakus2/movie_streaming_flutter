import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/media_model.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  int _selectedIndex = 0; // Індекс обраної категорії
  final List<IconData> icons = [Icons.remove_red_eye, Icons.bookmark, Icons.download];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final List<String> types = [AppLocalizations.of(context)!.watched, AppLocalizations.of(context)!.saved];

    return Scaffold(
      backgroundColor: Color.alphaBlend(
          Colors.white.withOpacity(0.15), Theme.of(context).secondaryHeaderColor),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.library,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              width: screenSize.width,
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: types.length,
                itemBuilder: (BuildContext context, int index) {
                  final isSelected = _selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                        side: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 2.0,
                        ),
                      ),
                      color: isSelected
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Center(
                          child: Row(
                            children: [
                              Icon(
                                icons[index],
                                color: isSelected
                                    ? Color.alphaBlend(
                                    Colors.white.withOpacity(0.15),
                                    Theme.of(context).secondaryHeaderColor)
                                    : Colors.white54,
                              ),
                              SizedBox(width: 10),
                              Text(
                                types[index],
                                style: TextStyle(
                                  color: isSelected
                                      ? Color.alphaBlend(
                                      Colors.white.withOpacity(0.15),
                                      Theme.of(context).secondaryHeaderColor)
                                      : Colors.white54,
                                  fontWeight: isSelected
                                      ? FontWeight.w900
                                      : FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 20),
              child: Row(
                children: [
                  Text(
                    types[_selectedIndex],
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 0.5,
                  ),
                  itemCount: movies.length,
                  itemBuilder: (BuildContext context, int index){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          width: 150,
                          height: 199,
                          margin: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(movies[index].poster_path), // Використання URL з вашого моделі
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Text(
                          movies[index].title,
                          style: Theme.of(context).textTheme.titleSmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      ],
                    );
                  }
              ),
            ),

          ],
        ),
      ),
    );
  }
}
