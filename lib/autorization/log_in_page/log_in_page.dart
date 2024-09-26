import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_sctreaming/autorization/choose_genres_preferances/choose_genres_page.dart';
import 'package:movie_sctreaming/autorization/log_in_page/log_in_service.dart';
import 'package:movie_sctreaming/autorization/sign_in_page/sign_in_page.dart';
import 'package:movie_sctreaming/bottom_navigation_bar/bottom_nav_bar.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isEmailFieldEmpty = false;
  bool _isPasswordFieldEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.alphaBlend(
          Colors.white.withOpacity(0.15), Theme.of(context).secondaryHeaderColor),

      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 25,right: 25, top: 100, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppLocalizations.of(context)!.log_in,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 20,),
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
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).dialogBackgroundColor,
                          width: 2.0,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).dialogBackgroundColor,
                          width: 2.0,
                        ),
                      ),
                      hintText: AppLocalizations.of(context)!.email,
                      errorText: _isEmailFieldEmpty ?  AppLocalizations.of(context)?.enterEmail : null,
                      errorStyle: Theme.of(context).textTheme.headlineSmall,
                    ),
                    onChanged: (value){
                      setState(() {
                        _isEmailFieldEmpty = emailController.text.isEmpty;
                      });
                    },
                  ),
                  const SizedBox(height: 15,),
                  TextField(
                    controller: passwordController,
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
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).dialogBackgroundColor,
                          width: 2.0,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).dialogBackgroundColor,
                          width: 2.0,
                        ),
                      ),
                      hintText: AppLocalizations.of(context)!.password,
                      errorText: _isPasswordFieldEmpty ?  AppLocalizations.of(context)?.enterPassword : null,
                      errorStyle: Theme.of(context).textTheme.headlineSmall,
                    ),
                    onChanged: (value){
                      setState(() {
                        _isPasswordFieldEmpty = passwordController.text.isEmpty;
                      });
                    },
                  ),
                  const SizedBox(height: 30,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async{
                        if(!_isEmailFieldEmpty && !_isPasswordFieldEmpty){
                          if(await LogInService.signInWithEmailAndPassword(emailController.text, passwordController.text)){
                            if(await LogInService.checkPreferences()){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const BottomNavBar()),
                              );
                            }else{
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ChooseGenresPage()),
                              );
                            }
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.log_in,
                        style: const TextStyle(
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
                Text(AppLocalizations.of(context)!.dont_have_an_account,
                style: Theme.of(context).textTheme.titleSmall,),
                TextButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInPage()),
                  );
                },
                    child: Text(AppLocalizations.of(context)!.sign_in,
                  style: Theme.of(context).textTheme.headlineSmall,))
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
