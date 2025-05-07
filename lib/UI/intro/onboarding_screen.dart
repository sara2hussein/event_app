import 'package:event_app/utels/app_colors.dart';
import 'package:event_app/utels/app_styles.dart';
import 'package:event_app/utels/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String routeName = '/onboarding';

  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          bodyWidget: _buildPage(
            context,
            pageImage: AssetsManager.intro1,
            title: AppLocalizations.of(context)!.find,
            body: AppLocalizations.of(context)!.dive,
          ),
        ),
        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          bodyWidget: _buildPage(
            context,
            pageImage: AssetsManager.intro2,
            title: AppLocalizations.of(context)!.effortless,
            body: AppLocalizations.of(context)!.take,
          ),
        ),
        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          bodyWidget: _buildPage(
            context,
            pageImage: AssetsManager.intro3,
            title: AppLocalizations.of(context)!.conect,
            body: AppLocalizations.of(context)!.make,
          ),
        ),
      ],
      showSkipButton: true,
      skip: const Icon(Icons.skip_next, color: AppColors.primaryLight),
      next: Text(
        AppLocalizations.of(context)!.next,
        style: AppStyles.bold14Primary,
      ),
      done: Text(
        AppLocalizations.of(context)!.done,
        style: AppStyles.bold14Primary,
      ),
      onDone: () {
        Navigator.pushReplacementNamed(context, '/login_screen');
      },
      onSkip: () {
        Navigator.pushReplacementNamed(context, '/login_screen');
      },
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: AppColors.primaryLight,
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }

  Widget _buildPage(
    BuildContext context, {
    required String pageImage,
    required String title,
    required String body,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Image.asset(AssetsManager.logo_top, height: 70)),

        const SizedBox(height: 30),

        Center(child: Image.asset(pageImage, height: 357)),

        const SizedBox(height: 30),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppStyles.bold20Primary,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 12),
              Text(
                body,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
