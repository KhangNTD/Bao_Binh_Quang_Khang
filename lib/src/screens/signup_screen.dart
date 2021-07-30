import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/user_event.dart';
import '../blocs/user_bloc.dart';
import '../blocs/user_state.dart';
import '../constants/constants_color.dart';
import '../widgets/responsive.dart';
import '../widgets/logo.dart';
import '../constants/constants_text.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Responsive(
                mobile: Column(
                  children: [
                    Container(
                      height: 285,
                      width: double.infinity,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image:
                              new AssetImage('assets/images/sigup_screen.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      padding: EdgeInsets.fromLTRB(25, 60, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Logo(
                            onboardingScreen: false,
                            tabletScreen: false,
                          ),
                          SizedBox(height: 45),
                          Text(SignUpText.titleStartMobile,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(
                                      fontFamily: AppConstants.fontRegular,
                                      color: AppColors.title,
                                      fontSize: 24)),
                        ],
                      ),
                    ),
                    BoxSignUp()
                  ],
                ),
                tablet: Stack(
                  children: [
                    Opacity(
                      opacity: 0.25,
                      child: Image.asset(
                        'assets/images/photo-1520981825232-ece5fae45120.jpeg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Center(
                        child: Column(
                      children: [
                        SizedBox(height: 50),
                        Logo(onboardingScreen: false, tabletScreen: true),
                        SizedBox(
                          height: 150,
                        ),
                        Text(SignUpText.titleStartTablet,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(
                                    fontFamily: AppConstants.fontRegular,
                                    color: AppColors.title,
                                    fontSize: 24)),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            height: 500,
                            width: 475,
                            child: BoxSignUp())
                      ],
                    ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class BoxSignUp extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isValidEmail = false;
  bool isValidPassword = false;
  String _email = '';
  String _password = '';
  dynamic textEmailError;
  dynamic textPasswordError;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        checkSignUp(context, state);
        return Padding(
            padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(SignUpText.subTitleCreateAccount,
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontFamily: AppConstants.fontRegular,
                            color: AppColors.mainThemeColor,
                            fontSize: 16,
                          )),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        SignUpText.fullName,
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontFamily: AppConstants.fontRegular,
                            color: AppColors.fieldTitle,
                            fontSize: 14),
                      ),
                      TextField(
                        cursorColor: AppColors.mainThemeColor,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.mainThemeColor,
                              width: 2,
                            ),
                          ),
                          contentPadding: EdgeInsets.only(top: 15, bottom: 5),
                          isDense: true,
                        ),
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontFamily: AppConstants.fontRegular,
                            color: AppColors.title,
                            fontSize: 16),
                      ),
                      SizedBox(height: 30),
                      Text(SignUpText.email,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(
                                  fontFamily: AppConstants.fontRegular,
                                  color: AppColors.fieldTitle,
                                  fontSize: 14)),
                      TextField(
                        controller: _emailController,
                        cursorColor: AppColors.mainThemeColor,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) => _email = value,
                        onSubmitted: (email) => context
                            .read<UserBloc>()
                            .add(UserEmailSubmitted(email)),
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.mainThemeColor,
                                width: 2,
                              ),
                            ),
                            contentPadding: EdgeInsets.only(top: 15, bottom: 5),
                            isDense: true,
                            errorText: textEmailError),
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontFamily: AppConstants.fontRegular,
                            color: AppColors.title,
                            fontSize: 16),
                      ),
                      SizedBox(height: 30),
                      Text(SignUpText.password,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(
                                  fontFamily: AppConstants.fontRegular,
                                  color: AppColors.fieldTitle,
                                  fontSize: 14)),
                      TextField(
                        controller: _passwordController,
                        cursorColor: AppColors.mainThemeColor,
                        obscureText: true,
                        onChanged: (value) => _password = value,
                        onSubmitted: (password) => context
                            .read<UserBloc>()
                            .add(UserPasswordSubmitted(password)),
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.mainThemeColor,
                              width: 2,
                            ),
                          ),
                          contentPadding: EdgeInsets.only(top: 15, bottom: 5),
                          isDense: true,
                          errorText: textPasswordError,
                        ),
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontFamily: AppConstants.fontRegular,
                            color: AppColors.title,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
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
                      onPressed: () => checkErrSignUp(context),
                      child: Text(
                        SignUpText.buttonCreateAccount,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontFamily: AppConstants.fontRegular,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          SignUpText.subtitleAlrHaveAcc,
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontFamily: AppConstants.fontRegular,
                                    color: AppColors.fieldTitle,
                                    fontSize: 14,
                                  ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          SignUpText.subtitleLoginHere,
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontFamily: AppConstants.fontBold,
                                    color: AppColors.mainThemeColor,
                                    fontSize: 16,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }

  void checkSignUp(BuildContext context, UserState state) {
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
      case UserSignUpSuccess:
        textEmailError = null;
        textPasswordError = null;
        Future.delayed(Duration(milliseconds: 200),
            () => Navigator.of(context).pushNamed('/home'));
        break;
    }
  }

  void checkErrSignUp(BuildContext context) {
    if (textEmailError.toString().contains('null') &&
        textPasswordError.toString().contains('null') &&
        _email.isNotEmpty &&
        _password.isNotEmpty) {
      context
          .read<UserBloc>()
          .add(UserSignupButtonSubmitted(_email.trim(), _password));
    }
  }
}
