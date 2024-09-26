import 'package:flutter/material.dart';
import 'package:movie_sctreaming/services/user_service.dart';
import '../../models/media_model.dart';
import '../../services/media_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SubscriptionsPage extends StatelessWidget {
  const SubscriptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.alphaBlend(
          Colors.white.withOpacity(0.15), Theme.of(context).secondaryHeaderColor),
      body: Container(
        margin: const EdgeInsets.only(top: 45, left: 15, right: 15, bottom: 45),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.subscriptions,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 30),
            FutureBuilder<List<MediaModel>>(
              future: _fetchSubscriptionsWithDetails(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${AppLocalizations.of(context)!.error}: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text(AppLocalizations.of(context)!.noSubscriptionsFound),
                  );
                }

                List<MediaModel> subscriptions = snapshot.data!;
                return Expanded(
                  child: ListView.builder(
                    itemCount: subscriptions.length,
                    itemBuilder: (context, index) {
                      MediaModel media = subscriptions[index];
                      return Container(
                        width: screenSize.width,
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                                height: 120,
                                child: Image.network(
                                    media.posterPath ?? '',
                                  fit: BoxFit.cover,
                                )
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  media.title ?? 'Немає назви',
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  '${media.seasons!.length.toString()} ${AppLocalizations.of(context)!.seasons}'
                                ),
                                const Text(
                                    'Очікується: 2 сезон 12 серія'
                                ),
                                TextButton(
                                    onPressed: (){},
                                    child: Text(AppLocalizations.of(context)!.unfollow,
                                      style: Theme.of(context).textTheme.headlineSmall,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<List<MediaModel>> _fetchSubscriptionsWithDetails() async {
    List<dynamic> subscriptionIds = await UserService.getSubscriptions();

    List<MediaModel> subscriptions = [];
    for (String id in subscriptionIds) {
      MediaModel? media = await MediaService.getMovieById(id);
      if (media != null) {
        subscriptions.add(media);
      }
    }

    return subscriptions;
  }
}
