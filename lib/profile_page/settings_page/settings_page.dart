import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../models/genre_model.dart';
import '../../models/user_model.dart';
import '../../services/genre_service.dart';
import '../../services/user_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<GenreModel> _selectedGenres = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  UserModel? _currentUser;
  String? _selectedGender;

  @override
  void initState() {
    super.initState();
    _loadUserSelectedGenres();
    _loadUserData();
  }

  Future<void> _loadUserSelectedGenres() async {
    List<GenreModel> userGenres = await GenreService.getGenresFromCurrentUser();
    setState(() {
      _selectedGenres = userGenres;
    });
  }

  Future<void> _loadUserData() async {
    UserModel? user = await UserService.getCurrentUser();
    if (user != null) {
      setState(() {
        _currentUser = user;
        nameController.text = user.name;
        emailController.text = user.email;
        _selectedGender = user.gender;
        _dateOfBirthController.text = user.dateOfBirth != null
            ? DateFormat('dd-MM-yyyy').format(user.dateOfBirth!)
            : '';
      });
    }
  }

  void saveChanges() async{
    UserModel userModel = UserModel(
        name: nameController.text,
        email: emailController.text,
        gender: _selectedGender,
        dateOfBirth: DateFormat('dd-MM-yyyy').parse(_dateOfBirthController.text),
    );

    await UserService.updateUser(userModel);
    await GenreService.saveGenresToCurrentUser(_selectedGenres);
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
            const SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_currentUser == null)
                      const Center(child: CircularProgressIndicator())
                    else ...[
                      Text(
                        'Змінити інформацію',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        AppLocalizations.of(context)!.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 5),
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35.0),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35.0),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        AppLocalizations.of(context)!.email,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 5),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35.0),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35.0),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.gender,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              width: screenSize.width * 0.4,
                              child: DropdownButtonFormField<String>(
                                value: _selectedGender,
                                items: const [
                                  DropdownMenuItem(
                                    value: 'Male',
                                    child: Text('Male'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Female',
                                    child: Text('Female'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Other',
                                    child: Text('Other'),
                                  ),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    _selectedGender = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(35.0),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 2.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(35.0),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.dateOfBirth,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              width: screenSize.width * 0.5,
                              child: TextFormField(
                                readOnly: true,
                                controller: _dateOfBirthController,
                                decoration: InputDecoration(
                                  hintText: AppLocalizations.of(context)!.chooseDate,
                                  suffixIcon: const Icon(Icons.calendar_today),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(35.0),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 2.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(35.0),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now(),
                                  );
                                  if (pickedDate != null) {
                                    setState(() {
                                      _dateOfBirthController.text =
                                      "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
                                    });
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),
                    Text(
                      AppLocalizations.of(context)!.favourite,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 15),
                    FutureBuilder<List<GenreModel>>(
                      future: GenreService.getGenresFromDB(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return Center(child: Text(
                              AppLocalizations.of(context)!.noGenresFound
                          ));
                        }

                        final genres = snapshot.data!;

                        return Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: genres.map((genre) {
                            final isSelected = _selectedGenres
                                .any((selectedGenre) => selectedGenre.id == genre.id);
                            return ChoiceChip(
                              label: Text(genre.name),
                              selected: isSelected,
                              onSelected: (selected) {
                                setState(() {
                                  if (selected) {
                                    _selectedGenres.add(genre);
                                  } else {
                                    _selectedGenres.removeWhere(
                                            (selectedGenre) =>
                                        selectedGenre.id == genre.id);
                                  }
                                });
                              },
                              selectedColor: Theme.of(context).primaryColor,
                              backgroundColor:
                              Theme.of(context).dialogBackgroundColor,
                              labelStyle: TextStyle(
                                fontSize: 18,
                                color: isSelected
                                    ? Colors.white
                                    : Theme.of(context).dividerColor,
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  saveChanges();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context)!.save,
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
    );
  }
}
