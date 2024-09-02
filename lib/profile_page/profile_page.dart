
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_sctreaming/models/user_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_sctreaming/profile_page/profile_service.dart';

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
            return Container(
              child: Text('Неможливо завантажити дані'),
            );
          }
          UserModel? user = snapshot!.data;
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
                            Text(user!.email,
                              style: Theme.of(context).textTheme.titleSmall,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
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
                  onTap: () {
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
                        Text(AppLocalizations.of(context)!.log_in, style: Theme.of(context).textTheme.titleMedium,),
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
