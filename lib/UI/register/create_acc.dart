import 'package:event_app/UI/home/tabs/floting_button/custom_elevated_button.dart';
import 'package:event_app/UI/home/tabs/love/custom_text_feild.dart';
import 'package:event_app/UI/intro/togle/image_toggle_switch.dart';
import 'package:event_app/UI/register/lodin_screen.dart';
import 'package:event_app/provider/languge_provider.dart';
import 'package:event_app/utels/app_colors.dart';
import 'package:event_app/utels/app_styles.dart';
import 'package:event_app/utels/assets_manager.dart';
import 'package:event_app/utels/dialog_utels.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class CreateAcc extends StatefulWidget {
  static const String routeName = '/create_acc';

  @override
  State<CreateAcc> createState() => _CreateAccState();
}

class _CreateAccState extends State<CreateAcc> {
  TextEditingController emailController = TextEditingController(
    text: 'sara2.7ussein@gmail.com',
  );

  TextEditingController passwordController = TextEditingController(
    text: '123456',
  );

  TextEditingController repasswordController = TextEditingController(
    text: '123456',
  );

  TextEditingController nameController = TextEditingController(text: 'sara');

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var languageProvider = Provider.of<LangugeProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.whiteBgColor,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.create_account,
          style: AppStyles.medium16Black,
        ),
      ),
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
                  Image.asset(AssetsManager.logo, height: height * 0.20),
                  SizedBox(height: height * 0.02),
                  CustomTextFeild(
                    prefixIcon: Image.asset(AssetsManager.IconUser),
                    hintText: AppLocalizations.of(context)!.name,
                    controller: nameController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter name';
                      }
                      return null;
                    },
                  ),
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
                  SizedBox(height: height * 0.02),
                  CustomTextFeild(
                    prefixIcon: Image.asset(AssetsManager.IconPass),
                    hintText: AppLocalizations.of(context)!.re_password,
                    suffixIcon: Image.asset(AssetsManager.eye_slash),
                    controller: repasswordController,
                    obscureText: true,
                    keyboardInputType: TextInputType.number,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter password';
                      }
                      if (text.length < 6) {
                        return 'pasword shoud be at least 6 chars';
                      }
                      if (text != passwordController.text) {
                        return "Re-Password dosent't match Password";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.02),

                  CustomElevatedButton(
                    onButtonClick: () => register(context),

                    text: AppLocalizations.of(context)!.create_account,
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.already_have_acc,
                        style: AppStyles.medium16Black,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(
                            context,
                          ).pushNamed(LoginScreen.routeName);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.login,
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

  void register(BuildContext context) async {
    if (formKey.currentState?.validate() == true) {
      DialogUtels.showMessage(context: context, message: 'Loading...');

      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
        DialogUtels.hideLoading(context);
        DialogUtels.showMessage(
          context: context,
          message: 'create account successsfuly',
          title: 'Success',
          posActionName: 'OK',
          posAction: () {
            Navigator.of(context).pushNamed(LoginScreen.routeName);
          },
        );
        print('create account successsfuly');
        print(credential.user?.uid ?? '');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          DialogUtels.hideLoading(context);
          DialogUtels.showMessage(
            context: context,
            message: 'The password provided is too weak.',
            title: 'Error',
            posActionName: 'OK',
          );
        } else if (e.code == 'email-already-in-use') {
          DialogUtels.hideLoading(context);
          DialogUtels.showMessage(
            context: context,
            message: 'The account already for that email.',
            title: 'Error',
            posActionName: 'OK',
          );
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
