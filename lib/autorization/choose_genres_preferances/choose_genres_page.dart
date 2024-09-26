import 'package:flutter/material.dart';
import 'package:movie_sctreaming/bottom_navigation_bar/bottom_nav_bar.dart';
import '../../models/genre_model.dart';
import '../../services/genre_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChooseGenresPage extends StatefulWidget {
  const ChooseGenresPage({super.key});

  @override
  _ChooseGenresPageState createState() => _ChooseGenresPageState();
}

class _ChooseGenresPageState extends State<ChooseGenresPage> {
  final List<GenreModel> _selectedGenres = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.alphaBlend(
          Colors.white.withOpacity(0.15), Theme.of(context).secondaryHeaderColor),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {

                  },
                  child: Text(AppLocalizations.of(context)!.skip, style: Theme.of(context).textTheme.labelMedium),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                  AppLocalizations.of(context)!.chooseFavGenres,
                  style: Theme.of(context).textTheme.displaySmall
              ),
              const SizedBox(height: 10),

              Expanded(
                child: FutureBuilder<List<GenreModel>>(
                  future: GenreService.getGenresFromDB(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                          child: Text(AppLocalizations.of(context)!.noGenresFound)
                      );
                    }

                    final genres = snapshot.data!;

                    return SingleChildScrollView(
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: genres.map((genre) {
                          final isSelected = _selectedGenres.any((selectedGenre) => selectedGenre.id == genre.id);
                          return ChoiceChip(
                            label: Text(genre.name),
                            selected: isSelected,
                            onSelected: (selected) {
                              setState(() {
                                if (selected) {
                                  _selectedGenres.add(genre);
                                } else {
                                  _selectedGenres.removeWhere((selectedGenre) => selectedGenre.id == genre.id);
                                }
                              });
                            },
                            selectedColor: Theme.of(context).primaryColor,
                            backgroundColor: Theme.of(context).dialogBackgroundColor,
                            labelStyle: TextStyle(
                              fontSize: 18,
                              color: isSelected ? Colors.white : Theme.of(context).dividerColor,
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () async{
                    await GenreService.saveGenresToCurrentUser(_selectedGenres);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BottomNavBar()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.continuePage,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

