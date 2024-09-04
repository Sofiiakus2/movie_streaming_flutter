import 'package:flutter/material.dart';
import 'package:movie_sctreaming/services/filters_service.dart';

class FiltersDialog extends StatefulWidget {
  const FiltersDialog({super.key});

  @override
  _FiltersDialogState createState() => _FiltersDialogState();
}

class _FiltersDialogState extends State<FiltersDialog> {
  List<String> _countries = [];
  Set<String> _selectedCountries = {};
  List<int> _years = [];
  Set<int> _selectedYears = {};

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      List<String> countries = await FiltersService.getCountriesFromMovies();
      List<int> years = await FiltersService.getYearsFromMovies();

      setState(() {
        _countries = countries;
        _years = years;
      });
    } catch (e) {
      print('Error loading countries: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Фільтри'),
      titleTextStyle: Theme.of(context).textTheme.titleLarge,
      content: _countries.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Країна',
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
            }).toList(),
            Text(
              'Рік',
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
            }).toList(),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop({
              'selectedCountries': _selectedCountries.toList(),
              'selectedYears': _selectedYears.toList(),
            });
          },
          child: Text(
            'Застосувати',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Скасувати',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ],
    );
  }
}
