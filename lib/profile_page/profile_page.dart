
import 'package:flutter/material.dart';
import 'package:movie_sctreaming/models/user_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_sctreaming/profile_page/notifications_story_page/notifications_story.dart';
import 'package:movie_sctreaming/profile_page/profile_service.dart';
import 'package:movie_sctreaming/profile_page/rules_page/rules_page.dart';
import 'package:movie_sctreaming/profile_page/settings_page/settings_page.dart';
import 'package:movie_sctreaming/profile_page/statistics_page/statistics_page.dart';
import 'package:movie_sctreaming/profile_page/subscriptions_page/subscriptions_page.dart';
import '../autorization/auth_service.dart';
import '../autorization/log_in_page/log_in_page.dart';
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.alphaBlend(
          Colors.white.withOpacity(0.15), Theme.of(context).secondaryHeaderColor),
      body: FutureBuilder<UserModel>(
        future: ProfileService.getMainPersonalInfo(),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return Text(AppLocalizations.of(context)!.errorGettingData);
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return const CircularProgressIndicator();
          }
          UserModel? user = snapshot.data;
          return Container(
            height: screenSize.height,
            width: screenSize.width,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: [
                SizedBox(
                  width: screenSize.width,
                  height: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.account_circle_rounded,
                            size: 100,
                            color: Theme.of(context).dialogBackgroundColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0, left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(user!.name,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Text(user.email,
                                  style: Theme.of(context).textTheme.titleSmall,
                                )
                              ],
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(ProfileService.createRoute(const SettingsPage()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: screenSize.width,
                    height: 50,
                    color: Theme.of(context).dividerColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppLocalizations.of(context)!.settings, style: Theme.of(context).textTheme.titleMedium,),
                        const Icon(Icons.navigate_next)                ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(ProfileService.createRoute(const SubscriptionsPage()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: screenSize.width,
                    height: 50,
                    color: Theme.of(context).dividerColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppLocalizations.of(context)!.subscriptions, style: Theme.of(context).textTheme.titleMedium,),
                        const Icon(Icons.navigate_next)                ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(ProfileService.createRoute(const StatisticsPage()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: screenSize.width,
                    height: 50,
                    color: Theme.of(context).dividerColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppLocalizations.of(context)!.statistics, style: Theme.of(context).textTheme.titleMedium,),
                        const Icon(Icons.navigate_next)                ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(ProfileService.createRoute(const RulesPage()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: screenSize.width,
                    height: 50,
                    color: Theme.of(context).dividerColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppLocalizations.of(context)!.rules_of_using, style: Theme.of(context).textTheme.titleMedium,),
                        const Icon(Icons.navigate_next)                ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(ProfileService.createRoute(const NotificationsStory()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: screenSize.width,
                    height: 50,
                    color: Theme.of(context).dividerColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppLocalizations.of(context)!.notificationStory, style: Theme.of(context).textTheme.titleMedium,),
                        const Icon(Icons.navigate_next)                ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await AuthService.signOut();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LogInPage()),
                    );
                  },

                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: screenSize.width,
                    height: 50,
                    color: Theme.of(context).dividerColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppLocalizations.of(context)!.sign_out, style: Theme.of(context).textTheme.titleMedium,),
                        const Icon(Icons.navigate_next)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
