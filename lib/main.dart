import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/UI/home/home_screen.dart';
import 'package:event_app/UI/home/tabs/floting_button/add_event.dart';
import 'package:event_app/UI/intro/intro_screen.dart';
import 'package:event_app/UI/intro/onboarding_screen.dart';
import 'package:event_app/UI/register/create_acc.dart';
import 'package:event_app/UI/register/forget_pass.dart';
import 'package:event_app/UI/register/lodin_screen.dart';
import 'package:event_app/provider/event_list_provide.dart';
import 'package:event_app/provider/languge_provider.dart';
import 'package:event_app/provider/theme_provider.dart';
import 'package:event_app/provider/user_provider.dart';
import 'package:event_app/utels/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseFirestore.instance.disableNetwork();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LangugeProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => EventListProvide()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var langugeProvider = Provider.of<LangugeProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: IntroScreen.routeName,
      routes: {
        IntroScreen.routeName: (context) => IntroScreen(),
        OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
        AddEventScreen.routeName: (context) => AddEventScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        CreateAcc.routeName: (context) => CreateAcc(),
        ForgetPass.routeName: (context) => ForgetPass(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(langugeProvider.currentLocal),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.currentTheme,
    );
  }
}
