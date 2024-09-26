import 'package:flutter/material.dart';
import 'package:movie_sctreaming/models/notification_model.dart';
import 'package:movie_sctreaming/services/user_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationsStory extends StatelessWidget {
  const NotificationsStory({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> months = [
      AppLocalizations.of(context)!.january, AppLocalizations.of(context)!.february, AppLocalizations.of(context)!.march, AppLocalizations.of(context)!.april, AppLocalizations.of(context)!.may, AppLocalizations.of(context)!.june,
    AppLocalizations.of(context)!.july, AppLocalizations.of(context)!.august, AppLocalizations.of(context)!.september, AppLocalizations.of(context)!.october, AppLocalizations.of(context)!.november, AppLocalizations.of(context)!.december
    ];

    return Scaffold(
      backgroundColor: Color.alphaBlend(
          Colors.white.withOpacity(0.15), Theme.of(context).secondaryHeaderColor),
      body: Container(
        margin: const EdgeInsets.only(top: 45, left: 15, right: 15, bottom: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.notificationStory,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 30),
            Expanded(
              child: FutureBuilder<List<CustomNotificationModel>>(
                  future: UserService.getNotificationsForUser(),
                  builder: (context, snapshot){
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('${AppLocalizations.of(context)!.error}: ${snapshot.error}'),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text(''),
                      );
                    }
                    final notifications = snapshot.data!;
                    return ListView.builder(
                      itemCount: notifications.length,
                      itemBuilder: (context, index) {
                        final notification = notifications[notifications.length - 1 - index];
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).dividerColor,
                          ),
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            margin: const EdgeInsets.all(15),

                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("${notification.date.day} ${months[notification.date.month - 1]}"),
                                      Text("${notification.date.hour} : ${notification.date.minute}"),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Theme.of(context).primaryColor,
                                        radius: 14,
                                        child: const Icon(Icons.notifications, color: Colors.white, size: 16,),
                                      ),
                                      const SizedBox(width: 15,),
                                      Text(notification.title, style: Theme.of(context).textTheme.titleMedium,)
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Text(notification.body),
                                  const SizedBox(height: 12,),
                                ]
                            ),
                          ),
                        );
                      },
                    );

                  }),
            ),
          ],
        ),
      ),

    );
  }
}
