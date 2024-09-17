
import 'package:flutter/material.dart';

import '../../../models/people_model.dart';

class PeopleInfoGrid extends StatelessWidget {
  const PeopleInfoGrid({super.key, required this.people});
  final List<People> people;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.6,
      ),
      itemCount: people.length,
      itemBuilder: (BuildContext context, int index) {
        final person = people[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: screenSize.width / 3,
              height: screenSize.width / 3,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: Image.network(
                  person.posterUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              person.name,
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
