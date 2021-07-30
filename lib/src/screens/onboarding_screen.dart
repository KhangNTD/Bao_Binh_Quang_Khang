import 'package:flutter/material.dart';

import '../constants/constants_color.dart';
import '../constants/constants_text.dart';
import '../widgets/logo.dart';
import '../widgets/responsive.dart';

class OnboardingScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    double widthsizebutton = 239;
    double heightsizebutton = 50;
    double spacingLogoWithAppBar = 80;
    double spacingTitleWithSubTitle = 8;
    double spacingSubTitleWithButton = 34;
    double spacingButton = 20;
    return Responsive(
      mobile: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/backgroundloading.png'),
                alignment: Alignment.bottomCenter,
                fit: BoxFit.none,
                scale: 0.99)),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/login');
          },
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.5),
                  ])),
              height: double.infinity,
              child: Logo(
                onboardingScreen: true,
                tabletScreen: false,
              ),
            ),
          ),
        ),
      ),
      tablet: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/backgroundloading.png'),
          alignment: Alignment(0, 1.1),
          fit: BoxFit.none,
          scale: 0.7,
        )),
        child: SafeArea(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.white,
                    Colors.white,
                    Colors.white.withOpacity(1),
                    Colors.white.withOpacity(0.7),
                    Colors.white.withOpacity(0.6),
                  ])),
              child: Column(
                children: [
                  SizedBox(
                    height: spacingLogoWithAppBar,
                  ),
                  Logo(
                    onboardingScreen: true,
                    tabletScreen: true,
                  ),
                  Spacer(),
                  Text(
                    OnBoarding.titleOnboarding,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2?.copyWith(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: AppColors.title,
                        fontFamily: AppConstants.fontSemiBold),
                  ),
                  SizedBox(
                    height: spacingTitleWithSubTitle,
                  ),
                  Text(
                    OnBoarding.subtitleOnBoarding,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        fontWeight: FontWeight.normal,
                        fontFamily: AppConstants.fontRegular,
                        color: AppColors.fieldTitle),
                  ),
                  SizedBox(
                    height: spacingSubTitleWithButton,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.mainThemeColor,
                          minimumSize: Size(widthsizebutton, heightsizebutton),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/login');
                        },
                        child: Text(
                          OnBoarding.buttonJoinScracth,
                          style: Theme.of(context).textTheme.button?.copyWith(
                                color: Colors.white,
                                fontFamily: AppConstants.fontBold,
                              ),
                        ),
                      ),
                      SizedBox(
                        width: spacingButton,
                      ),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            minimumSize:
                                Size(widthsizebutton, heightsizebutton),
                            side: BorderSide(
                              color: AppColors.mainThemeColor,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/login');
                          },
                          child: Text(OnBoarding.buttonLearnMore,
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(
                                      color: AppColors.mainThemeColor,
                                      fontFamily: AppConstants.fontBold)))
                    ],
                  ),
                  Spacer(
                    flex: 2,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
