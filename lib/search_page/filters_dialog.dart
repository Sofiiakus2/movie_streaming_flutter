import 'package:flutter/material.dart';
import 'package:movie_sctreaming/services/filters_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FiltersDialog extends StatefulWidget {
  const FiltersDialog({super.key});

  @override
  _FiltersDialogState createState() => _FiltersDialogState();
}

class _FiltersDialogState extends State<FiltersDialog> {
  List<String> _countries = [];
  final Set<String> _selectedCountries = {};
  List<int> _years = [];
  final Set<int> _selectedYears = {};

  @override
  void initState() {
    super.initState();
    _loadFilters();
  }

  Future<void> _loadFilters() async {
    try {
      List<String> countries = await FiltersService.getCountriesFromMovies();
      List<int> years = await FiltersService.getYearsFromMovies();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> savedCountries = prefs.getStringList('selectedCountries') ?? [];
      List<int> savedYears = prefs.getStringList('selectedYears')?.map((e) => int.parse(e)).toList() ?? [];

      setState(() {
        _countries = countries;
        _years = years;
        _selectedCountries.addAll(savedCountries);
        _selectedYears.addAll(savedYears);
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _saveFilters() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('selectedCountries', _selectedCountries.toList());
    await prefs.setStringList('selectedYears', _selectedYears.map((e) => e.toString()).toList());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.filters),
      titleTextStyle: Theme.of(context).textTheme.titleLarge,
      content: _countries.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppLocalizations.of(context)!.country,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ..._countries.map((country) {
              return CheckboxListTile(
                title: Text(
                  country,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                value: _selectedCountries.contains(country),
                onChanged: (bool? selected) {
                  setState(() {
                    if (selected == true) {
                      _selectedCountries.add(country);
                    } else {
                      _selectedCountries.remove(country);
                    }
                  });
                },
                activeColor: Theme.of(context).primaryColor,
                checkColor: Colors.white,
              );
            }),
            Text(
              AppLocalizations.of(context)!.year,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ..._years.map((year) {
              return CheckboxListTile(
                title: Text(
                  year.toString(),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                value: _selectedYears.contains(year),
                onChanged: (bool? selected) {
                  setState(() {
                    if (selected == true) {
                      _selectedYears.add(year);
                    } else {
                      _selectedYears.remove(year);
                    }
                  });
                },
                activeColor: Theme.of(context).primaryColor,
                checkColor: Colors.white,
              );
            }),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () async {
            await _saveFilters();
            Navigator.of(context).pop({
              'selectedCountries': _selectedCountries.toList(),
              'selectedYears': _selectedYears.toList(),
            });
          },
          child: Text(
            AppLocalizations.of(context)!.apply,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            AppLocalizations.of(context)!.cancel,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ],
    );
  }
}
