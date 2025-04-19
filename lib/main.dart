import 'package:event_app/UI/home/home_screen.dart';
import 'package:event_app/UI/intro/intro_screen.dart';
import 'package:event_app/UI/intro/onboarding_screen.dart';
import 'package:event_app/provider/languge_provider.dart';
import 'package:event_app/provider/theme_provider.dart';
import 'package:event_app/utels/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LangugeProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
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
      //home: const IntroScreen(),
      initialRoute: IntroScreen.routeName,
      routes: {
        IntroScreen.routeName: (context) => IntroScreen(),
        OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
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
