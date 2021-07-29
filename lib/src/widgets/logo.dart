import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo(
      {Key? key, required this.onboardingScreen, required this.tabletScreen})
      : super(key: key);
  final bool onboardingScreen;
  final bool tabletScreen;
  @override
  Widget build(BuildContext context) {
    double widthLogo;
    double heightLogo;
    var alignmentText = MainAxisAlignment.start;
    if (onboardingScreen) {
      widthLogo = 25;
      heightLogo = 36;
      alignmentText = MainAxisAlignment.center;
    }
    if (tabletScreen) {
      widthLogo = 18;
      heightLogo = 26;
      alignmentText = MainAxisAlignment.center;
    } else {
      widthLogo = 18;
      heightLogo = 26;
    }
    return Row(
      mainAxisAlignment: alignmentText,
      children: [
        Image(
          image: AssetImage("assets/icons/logo_icon.png"),
          width: widthLogo,
          height: heightLogo,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "scratch",
          style: Theme.of(context).textTheme.headline6?.copyWith(
                fontWeight: FontWeight.normal,
                fontFamily: 'Nunito-Bold',
                color: Color(0xff363837),
                fontSize: 20,
              ),
        ),
      ],
    );
  }
}
