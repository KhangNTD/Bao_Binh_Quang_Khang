import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/user_bloc.dart';
import '../blocs/user_event.dart';
import '../blocs/user_state.dart';
import '../widgets/responsive.dart';
import '../widgets/logo.dart';
import '../constants/constants_text.dart';
import '../constants/constants_color.dart';

class LoginScreen extends StatelessWidget {
  final double spaceBetweenItems = 30;
  final double spaceBetweenTexts = 15;
  final double smallTextSize = 14;
  final double mediumTextSize = 16;
  final double titleTextSize = 24;
  String _email = '';
  String _password = '';
  dynamic textEmailError;
  dynamic textPasswordError;
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
                                  color: AppColors.title,
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
                          color: AppColors.subTitle,
                          fontSize: smallTextSize),
                    ),
                    SizedBox(
                      height: spaceBetweenItems * 1.5,
                    ),
                    Text(
                      LoginText.email,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontFamily: AppConstants.fontBasic,
                          color: AppColors.fieldTitle,
                          fontSize: smallTextSize),
                    ),
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        checkLogIn(context, state);
                        return TextField(
                          keyboardType: TextInputType.emailAddress,
                          autofocus: true,
                          onChanged: (value) => _email = value,
                          onSubmitted: (email) => context
                              .read<UserBloc>()
                              .add(UserEmailSubmitted(email)),
                          cursorColor: AppColors.mainThemeColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                top: spaceBetweenTexts,
                                bottom: spaceBetweenTexts / 3),
                            isDense: true,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.mainThemeColor,
                                width: 2,
                              ),
                            ),
                            errorText: textEmailError,
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontFamily: AppConstants.fontBasic,
                                  color: AppColors.fieldText,
                                  fontSize: mediumTextSize),
                        );
                      },
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
                                  color: AppColors.fieldTitle,
                                  fontSize: smallTextSize),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/forgot-password');
                          },
                          child: Text(
                            LoginText.forgotPassword,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                    fontFamily: AppConstants.fontBasic,
                                    color: AppColors.fieldSubTitle,
                                    fontSize: smallTextSize),
                          ),
                        ),
                      ],
                    ),
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        return TextField(
                          obscureText: true,
                          obscuringCharacter: '⬤',
                          onChanged: (value) => _password = value,
                          onSubmitted: (password) => context
                              .read<UserBloc>()
                              .add(UserPasswordSubmitted(password)),
                          cursorColor: AppColors.mainThemeColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                top: spaceBetweenTexts,
                                bottom: spaceBetweenTexts / 3),
                            isDense: true,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.mainThemeColor,
                                width: 2,
                              ),
                            ),
                            errorText: textPasswordError,
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontFamily: AppConstants.fontBasic,
                                  color: AppColors.fieldText,
                                  fontSize: mediumTextSize,
                                  letterSpacing: 1.5),
                        );
                      },
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
                              AppColors.mainThemeColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                        ),
                        onPressed: () => logIn(context),
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
                                      color: AppColors.bottomTitle,
                                      fontSize: smallTextSize,
                                    ),
                          ),
                          SizedBox(
                            height: spaceBetweenTexts / 3,
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.of(context).pushNamed('/signup'),
                            child: Text(
                              LoginText.buttonSignUp,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                    fontFamily: AppConstants.fontBasic,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.mainThemeColor,
                                    fontSize: mediumTextSize,
                                  ),
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
                      color: AppColors.title,
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
                    child: SingleChildScrollView(
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
                                    color: AppColors.subTitle,
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
                                    color: AppColors.fieldTitle,
                                    fontSize: smallTextSize),
                          ),
                          BlocBuilder<UserBloc, UserState>(
                            builder: (context, state) {
                              checkLogIn(context, state);
                              return TextField(
                                keyboardType: TextInputType.emailAddress,
                                autofocus: true,
                                onChanged: (value) => _email = value,
                                onSubmitted: (email) => context
                                    .read<UserBloc>()
                                    .add(UserEmailSubmitted(email)),
                                cursorColor: AppColors.mainThemeColor,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: spaceBetweenTexts,
                                      bottom: spaceBetweenTexts / 3),
                                  isDense: true,
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.mainThemeColor,
                                      width: 2,
                                    ),
                                  ),
                                  errorText: textEmailError,
                                ),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontFamily: AppConstants.fontBasic,
                                        color: AppColors.fieldText,
                                        fontSize: mediumTextSize),
                              );
                            },
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
                                        color: AppColors.fieldTitle,
                                        fontSize: smallTextSize),
                              ),
                              Text(
                                LoginText.forgotPassword,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                        fontFamily: AppConstants.fontBold,
                                        color: AppColors.fieldSubTitle,
                                        fontSize: smallTextSize),
                              ),
                            ],
                          ),
                          BlocBuilder<UserBloc, UserState>(
                            builder: (context, state) {
                              return TextField(
                                obscureText: true,
                                obscuringCharacter: '●',
                                onChanged: (value) => _password = value,
                                onSubmitted: (password) => context
                                    .read<UserBloc>()
                                    .add(UserPasswordSubmitted(password)),
                                cursorColor: AppColors.mainThemeColor,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: spaceBetweenTexts,
                                      bottom: spaceBetweenTexts / 3),
                                  isDense: true,
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.mainThemeColor,
                                      width: 2,
                                    ),
                                  ),
                                  errorText: textPasswordError,
                                ),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontFamily: AppConstants.fontBasic,
                                      color: AppColors.fieldText,
                                      fontSize: mediumTextSize,
                                    ),
                              );
                            },
                          ),
                          SizedBox(
                            height: spaceBetweenItems,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppColors.mainThemeColor),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                              ),
                              onPressed: () => logIn(context),
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
                                        color: AppColors.bottomTitle,
                                        fontSize: smallTextSize,
                                      ),
                                ),
                                SizedBox(
                                  height: spaceBetweenTexts / 3,
                                ),
                                TextButton(
                                  onPressed: () => Navigator.of(context)
                                      .pushNamed('/signup'),
                                  child: Text(
                                    LoginText.buttonSignUp,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                          fontFamily: AppConstants.fontBold,
                                          color: AppColors.mainThemeColor,
                                          fontSize: mediumTextSize,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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

  void logIn(BuildContext context) {
    if (textEmailError.toString().contains('null') &&
        textPasswordError.toString().contains('null') &&
        _email.isNotEmpty &&
        _password.isNotEmpty) {
      context
          .read<UserBloc>()
          .add(UserLoginButtonSubmitted(_email.trim(), _password));
    }
  }

  void checkLogIn(BuildContext context, UserState state) {
    switch (state.runtimeType) {
      case UserEmailSubmitFailure:
        textEmailError = AppConstants.invalidEmail;
        break;
      case UserPasswordSubmitFailure:
        textPasswordError = AppConstants.invalidPassword;
        break;
      case UserEmailSubmitSuccess:
        textEmailError = null;
        break;
      case UserPasswordSubmitSuccess:
        textPasswordError = null;
        break;
      case UserAuthFailure:
        state as UserAuthFailure;
        if (state.exception.code == 'user-not-found') {
          textEmailError = LoginText.accountNotFound;
        } else if (state.exception.code == 'wrong-password') {
          textPasswordError = LoginText.incorrectPassword;
        }
        break;
      case UserLoginSuccess:
        textEmailError = null;
        textPasswordError = null;
        Future.delayed(Duration(milliseconds: 200),
            () => Navigator.of(context).pushNamed('/home'));
        break;
    }
  }
}
