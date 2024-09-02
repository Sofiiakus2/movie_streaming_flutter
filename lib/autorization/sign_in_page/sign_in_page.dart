import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_sctreaming/autorization/log_in_page/log_in_page.dart';
import 'package:movie_sctreaming/autorization/sign_in_page/sign_in_service.dart';
import 'package:movie_sctreaming/models/user_model.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool _isNameFieldEmpty = false;
  bool _isEmailFieldEmpty = false;
  bool _isPasswordFieldEmpty = false;
  bool _isConfirmPasswordFieldEmpty = false;

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
                  Text(AppLocalizations.of(context)!.sign_in,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 20,),
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
                      hintText: AppLocalizations.of(context)!.name,
                      errorText: _isNameFieldEmpty ?  AppLocalizations.of(context)?.enterName : null,
                      errorStyle: Theme.of(context).textTheme.headlineSmall,
                    ),
                    onChanged: (value){
                      setState(() {
                        _isNameFieldEmpty = nameController.text.isEmpty;
                      });
                    },
                  ),
                  const SizedBox(height: 15,),
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
                      hintText: AppLocalizations.of(context)!.email,
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
                      errorText: _isEmailFieldEmpty ?  AppLocalizations.of(context)?.uncorrectData : null,
                      errorStyle: Theme.of(context).textTheme.headlineSmall,
                    ),
                    onChanged: (value){
                      setState(() {
                        _isEmailFieldEmpty = !SignInService.checkCorrectEmailInput(emailController.text);
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
                      errorText: _isPasswordFieldEmpty ?  AppLocalizations.of(context)?.notLessThan6Symbols : null,
                      errorStyle: Theme.of(context).textTheme.headlineSmall,
                    ),
                    onChanged: (value){
                      setState(() {
                        _isPasswordFieldEmpty = !SignInService.checkCorrectPasswordInput(passwordController.text);
                      });
                    },
                  ),
                  const SizedBox(height: 15,),
                  TextField(
                    controller: confirmPasswordController,
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
                      hintText: AppLocalizations.of(context)!.confirm_password,
                      errorText: _isConfirmPasswordFieldEmpty ?  AppLocalizations.of(context)?.passwordIsNotConfirm : null,
                      errorStyle: Theme.of(context).textTheme.headlineSmall,
                    ),
                    onChanged: (value){
                      setState(() {
                        _isConfirmPasswordFieldEmpty = !SignInService.checkCorrectPasswordConfirm(passwordController.text, confirmPasswordController.text);
                      });
                    },
                  ),
                  const SizedBox(height: 30,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if(!_isNameFieldEmpty && !_isEmailFieldEmpty && !_isPasswordFieldEmpty && !_isConfirmPasswordFieldEmpty){
                          UserModel newUser = UserModel(name: nameController.text, email: emailController.text, password: passwordController.text);
                          SignInService.signUp(newUser);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LogInPage()),
                          );
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
                        AppLocalizations.of(context)!.sign_in,
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
                  Text(AppLocalizations.of(context)!.already_have_an_account,
                    style: Theme.of(context).textTheme.titleSmall,),
                  TextButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LogInPage()),
                    );
                  },
                      child: Text(AppLocalizations.of(context)!.log_in,
                        style: Theme.of(context).textTheme.headlineSmall,))
                ],)
            ],
          ),
        ),
      ),
    );
  }
}

