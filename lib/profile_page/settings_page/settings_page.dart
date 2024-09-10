import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/genre_model.dart';
import '../../services/genre_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}
class _SettingsPageState extends State<SettingsPage> {
  List<GenreModel> _selectedGenres = [];

  @override
  void initState() {
    super.initState();
    _loadUserSelectedGenres();
  }

  Future<void> _loadUserSelectedGenres() async {
    List<GenreModel> userGenres = await GenreService.getGenresFromCurrentUser();
    setState(() {
      _selectedGenres = userGenres;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.alphaBlend(
          Colors.white.withOpacity(0.15), Theme.of(context).secondaryHeaderColor),
      body: Container(
        margin: const EdgeInsets.only(top: 45, left: 15, right: 15, bottom: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.settings,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(height: 30),
            Text(
              'Вподобання',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 15),
            Expanded(
              child: FutureBuilder<List<GenreModel>>(
                future: GenreService.getGenresFromDB(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No genres found."));
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
                  // await GenreService.saveGenresToCurrentUser(_selectedGenres);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const BottomNavBar()),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor, // Continue button color
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "CONTINUE",
                  style: TextStyle(
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
    );
  }
}
