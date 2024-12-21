import 'package:flutter/material.dart';
import 'package:food/app/app.router.dart';
import 'package:food/ui/common/app_colors.dart';
import 'package:food/widgets/main_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'onboarding_viewmodel.dart';

class OnboardingView extends StackedView<OnboardingViewModel> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OnboardingViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/img_bg.png')),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 130.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'WeNutri',
                      style: GoogleFonts.poppins(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: kcPrimaryColorOrange),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        'Best Healthy Food For Your Healthy Life',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: kcPrimaryColorOrange),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(25),
        child: MainButton(
          height: 70,
          radius: 30,
          title: 'Get Starteed',
          titleColor: kcPrimaryColorOrange,
          color: Colors.white,
          onTap: () {
            viewModel.navigationService.navigateTo(Routes.homeView);
          },
        ),
      ),
    );
  }

  @override
  OnboardingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OnboardingViewModel();
}
