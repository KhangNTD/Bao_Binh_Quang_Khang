import 'package:flutter/material.dart';

import '../constants/constants_color.dart';
import '../constants/constants_text.dart';
import '../widgets/logo.dart';
import '../widgets/responsive.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthsizebutton = 239;
    double heightsizebutton = 50;
    Color mainSectionColor = Colors.white;
    double mainSectionSpacing = 8;

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
                    mainSectionColor,
                    mainSectionColor.withOpacity(1),
                    mainSectionColor.withOpacity(1),
                    mainSectionColor.withOpacity(0.5),
                    mainSectionColor.withOpacity(0.5),
                  ])),
              height: double.infinity,
              // width: double.infinity,
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
          alignment: Alignment(0, 1.8),
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
                    mainSectionColor,
                    mainSectionColor.withOpacity(1),
                    mainSectionColor.withOpacity(1),
                    mainSectionColor.withOpacity(0.7),
                    mainSectionColor.withOpacity(0.6),
                  ])),
              child: Column(
                children: [
                  SizedBox(
                    height: mainSectionSpacing * 10,
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
                    height: mainSectionSpacing,
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
                    height: mainSectionSpacing * 4.25,
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
                                color: mainSectionColor,
                                fontFamily: AppConstants.fontBold,
                              ),
                        ),
                      ),
                      SizedBox(
                        width: mainSectionSpacing * 2.5,
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
