import 'package:flutter/material.dart';

import '../widgets/responsive.dart';
import '../widgets/logo.dart';
import '../constants/constants_text.dart';

class LoginScreen extends StatelessWidget {
  final double spaceBetweenItems = 30;
  final double spaceBetweenTexts = 15;
  final double smallTextSize = 14;
  final double mediumTextSize = 16;
  final double titleTextSize = 24;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Responsive(
        mobile: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                fit: StackFit.loose,
                children: [
                  Image.asset(
                    'assets/images/cover.png',
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: 285,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60, left: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Logo(onboardingScreen: false, tabletScreen: false),
                        SizedBox(
                          height: spaceBetweenItems * 1.5,
                        ),
                        Text(
                          LoginText.titleWelcome,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontFamily: AppConstants.fontBasic,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff030F09),
                                  fontSize: titleTextSize),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LoginText.subTitleLogin,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontFamily: AppConstants.fontBasic,
                          color: Color(0xff606060),
                          fontSize: smallTextSize),
                    ),
                    SizedBox(
                      height: spaceBetweenItems * 1.5,
                    ),
                    Text(
                      LoginText.email,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontFamily: AppConstants.fontBasic,
                          color: Color(0xffA8A8A8),
                          fontSize: smallTextSize),
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      autofocus: true,
                      cursorColor: Color(0xff30BE76),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            top: spaceBetweenTexts,
                            bottom: spaceBetweenTexts / 3),
                        isDense: true,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff30BE76),
                            width: 2,
                          ),
                        ),
                      ),
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontFamily: AppConstants.fontBasic,
                          color: Color(0xff030F09),
                          fontSize: mediumTextSize),
                    ),
                    SizedBox(
                      height: spaceBetweenItems,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LoginText.password,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  fontFamily: AppConstants.fontBasic,
                                  color: Color(0xffA8A8A8),
                                  fontSize: smallTextSize),
                        ),
                        Text(
                          LoginText.forgotPassword,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  fontFamily: AppConstants.fontBasic,
                                  color: Color(0xff606060),
                                  fontSize: smallTextSize),
                        ),
                      ],
                    ),
                    TextField(
                      obscureText: true,
                      obscuringCharacter: '⬤',
                      cursorColor: Color(0xff30BE76),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            top: spaceBetweenTexts,
                            bottom: spaceBetweenTexts / 3),
                        isDense: true,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff30BE76),
                            width: 2,
                          ),
                        ),
                      ),
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontFamily: AppConstants.fontBasic,
                          color: Color(0xff030F09),
                          fontSize: mediumTextSize,
                          letterSpacing: 1.5),
                    ),
                    SizedBox(
                      height: spaceBetweenItems,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xff30BE76)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                        ),
                        onPressed: () => {},
                        child: Text(
                          LoginText.buttonLogin,
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontFamily: AppConstants.fontBasic,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: mediumTextSize,
                                  ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: spaceBetweenItems,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            LoginText.subTitleSignUp,
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontFamily: AppConstants.fontBasic,
                                      color: Color(0xffA8A8A8),
                                      fontSize: smallTextSize,
                                    ),
                          ),
                          SizedBox(
                            height: spaceBetweenTexts / 3,
                          ),
                          Text(
                            LoginText.buttonSignUp,
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontFamily: AppConstants.fontBasic,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff30BE76),
                                      fontSize: mediumTextSize,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        tablet: Stack(
          children: [
            Image.asset(
              'assets/images/login_background.jpeg',
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(0.4),
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.75),
                      Colors.white.withOpacity(0.85),
                      Colors.white.withOpacity(1),
                    ]),
              ),
            ),
            Column(
              children: [
                Spacer(
                  flex: 3,
                ),
                Logo(onboardingScreen: false, tabletScreen: true),
                Spacer(
                  flex: 5,
                ),
                Text(
                  LoginText.titleWelcome,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontFamily: AppConstants.fontBold,
                      color: Color(0xff030F09),
                      fontSize: titleTextSize),
                ),
                Container(
                  width: 425,
                  height: 467,
                  margin: EdgeInsets.only(top: spaceBetweenItems * 1.25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LoginText.subTitleLogin,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  fontFamily: AppConstants.fontBold,
                                  color: Color(0xff606060),
                                  fontSize: smallTextSize),
                        ),
                        SizedBox(
                          height: spaceBetweenItems,
                        ),
                        Text(
                          LoginText.email,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  fontFamily: AppConstants.fontBasic,
                                  color: Color(0xffA8A8A8),
                                  fontSize: smallTextSize),
                        ),
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          autofocus: true,
                          cursorColor: Color(0xff30BE76),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                top: spaceBetweenTexts,
                                bottom: spaceBetweenTexts / 3),
                            isDense: true,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff30BE76),
                                width: 2,
                              ),
                            ),
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontFamily: AppConstants.fontBasic,
                                  color: Color(0xff030F09),
                                  fontSize: mediumTextSize),
                        ),
                        SizedBox(
                          height: spaceBetweenItems,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LoginText.password,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                      fontFamily: AppConstants.fontBasic,
                                      color: Color(0xffA8A8A8),
                                      fontSize: smallTextSize),
                            ),
                            Text(
                              LoginText.forgotPassword,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                      fontFamily: AppConstants.fontBold,
                                      color: Color(0xff606060),
                                      fontSize: smallTextSize),
                            ),
                          ],
                        ),
                        TextField(
                          obscureText: true,
                          obscuringCharacter: '●',
                          cursorColor: Color(0xff30BE76),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                top: spaceBetweenTexts,
                                bottom: spaceBetweenTexts / 3),
                            isDense: true,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff30BE76),
                                width: 2,
                              ),
                            ),
                          ),
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontFamily: AppConstants.fontBasic,
                                    color: Color(0xff030F09),
                                    fontSize: mediumTextSize,
                                  ),
                        ),
                        SizedBox(
                          height: spaceBetweenItems,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xff30BE76)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                            ),
                            onPressed: () => {},
                            child: Text(
                              LoginText.buttonLogin,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                    fontFamily: AppConstants.fontBold,
                                    color: Colors.white,
                                    fontSize: mediumTextSize,
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: spaceBetweenItems,
                        ),
                        Center(
                          child: Column(
                            children: [
                              Text(
                                LoginText.subTitleSignUp,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                      fontFamily: AppConstants.fontBasic,
                                      color: Color(0xffA8A8A8),
                                      fontSize: smallTextSize,
                                    ),
                              ),
                              SizedBox(
                                height: spaceBetweenTexts / 3,
                              ),
                              Text(
                                LoginText.buttonSignUp,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                      fontFamily: AppConstants.fontBold,
                                      color: Color(0xff30BE76),
                                      fontSize: mediumTextSize,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(
                  flex: 10,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
