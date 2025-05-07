import 'package:event_app/UI/home/tabs/floting_button/custom_elevated_button.dart';
import 'package:event_app/UI/home/tabs/love/custom_text_feild.dart';
import 'package:event_app/UI/intro/intro_screen.dart';
import 'package:event_app/UI/intro/togle/image_toggle_switch.dart';
import 'package:event_app/UI/register/create_acc.dart';
import 'package:event_app/UI/register/forget_pass.dart';
import 'package:event_app/provider/languge_provider.dart';
import 'package:event_app/utels/app_colors.dart';
import 'package:event_app/utels/app_styles.dart';
import 'package:event_app/utels/assets_manager.dart';
import 'package:event_app/utels/dialog_utels.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController(
    text: 'sara2.7ussein@gmail.com',
  );

  TextEditingController passwordController = TextEditingController(
    text: '123456',
  );

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var languageProvider = Provider.of<LangugeProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.04,
              vertical: height * 0.02,
            ),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: height * 0.02),
                  Image.asset(AssetsManager.logo, height: height * 0.22),
                  SizedBox(height: height * 0.02),
                  CustomTextFeild(
                    prefixIcon: Image.asset(AssetsManager.IconEmail),
                    hintText: AppLocalizations.of(context)!.email,
                    controller: emailController,
                    keyboardInputType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter email';
                      }
                      final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      ).hasMatch(text);
                      if (!emailValid) {
                        return 'Please enter valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextFeild(
                    prefixIcon: Image.asset(AssetsManager.IconPass),
                    hintText: AppLocalizations.of(context)!.password,
                    suffixIcon: Image.asset(AssetsManager.eye_slash),
                    controller: passwordController,
                    obscureText: true,

                    keyboardInputType: TextInputType.number,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter password';
                      }
                      if (text.length < 6) {
                        return 'pasword shoud be at least 6 chars';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.01),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(ForgetPass.routeName);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.forget_pass,

                          style: AppStyles.bold16Primary.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primaryLight,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  CustomElevatedButton(
                    onButtonClick: () => login(context),
                    text: AppLocalizations.of(context)!.login,
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.dont_have_acc,
                        style: AppStyles.medium16Black,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(CreateAcc.routeName);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.create_account,
                          style: AppStyles.medium16Primary.copyWith(
                            decorationColor: AppColors.primaryLight,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: AppColors.primaryLight,
                          indent: width * 0.02,
                          endIndent: width * 0.02,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.or,
                        style: AppStyles.bold16Primary,
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: AppColors.primaryLight,
                          indent: width * 0.02,
                          endIndent: width * 0.02,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: Image.asset(AssetsManager.googlicon, height: 24),
                    label: Text(
                      AppLocalizations.of(context)!.login_with_google,
                      style: AppStyles.medium16Primary,
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 20,
                      ),
                      side: BorderSide(color: AppColors.primaryLight),
                    ),
                  ),
                  SizedBox(height: height * 0.02),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 10),
                      ImageToggleSwitch(
                        firstImagePath: 'assets/images/LR.png',
                        secondImagePath: 'assets/images/EG.png',
                        onToggle: (index) {
                          if (index == 0) {
                            languageProvider.changeLanguge("en");
                          } else {
                            languageProvider.changeLanguge("ar");
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login(BuildContext context) async {
    if (formKey.currentState?.validate() == true) {
      DialogUtels.showMessage(context: context, message: 'Loading...');
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
        DialogUtels.hideLoading(context);
        DialogUtels.showMessage(
          context: context,
          message: 'login successsfuly',
          title: 'Success',
          posActionName: 'OK',
          posAction: () {
            Navigator.of(context).pushNamed(IntroScreen.routeName);
          },
        );
        print('login successsfuly');
        print(credential.user?.uid ?? '');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        } else if (e.code == 'invalid-credential') {
          DialogUtels.hideLoading(context);
          DialogUtels.showMessage(
            context: context,
            message: 'The supplied auth credential is incorrect.',
            title: 'Error',
            posActionName: 'OK',
          );
          print('The supplied auth credential is incorrect.');
        }
      } catch (e) {
        DialogUtels.hideLoading(context);
        DialogUtels.showMessage(
          context: context,
          message: e.toString(),
          title: 'Error',
          posActionName: 'OK',
        );

        print(e);
      }
    }
  }
}
