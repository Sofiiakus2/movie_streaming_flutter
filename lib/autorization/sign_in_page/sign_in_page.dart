import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.alphaBlend(
          Colors.white.withOpacity(0.15), Theme.of(context).secondaryHeaderColor),

      body: Container(
        margin: EdgeInsets.only(left: 25,right: 25, top: 100, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
            //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context)!.sign_in,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                TextField(
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
                    hintText: AppLocalizations.of(context)!.name,
                  ),
                ),
                TextField(
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
                    hintText: AppLocalizations.of(context)!.email,
                  ),
                ),TextField(
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
                    hintText: AppLocalizations.of(context)!.password,
                  ),
                ),TextField(
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
                    hintText: AppLocalizations.of(context)!.confirm_password,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.sign_in,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                )


              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(AppLocalizations.of(context)!.already_have_an_account,
              style: Theme.of(context).textTheme.titleSmall,),
              TextButton(onPressed: (){}, child: Text(AppLocalizations.of(context)!.sign_in,
                style: Theme.of(context).textTheme.headlineSmall,))
            ],)
          ],
        ),
      ),
    );
  }
}
