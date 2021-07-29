import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/src/blocs/users_bloc.dart';
import 'package:mobile_app/src/repositories/user_repositories.dart';

import '../constants/constants_color.dart';
import '../utils/validator.dart';
import '../widgets/logo.dart';
import '../constants/constants_text.dart';
import '../widgets/responsive.dart';

class ForgotPasswordScreen extends StatelessWidget {
  // final _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Responsive(
              mobile: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 65,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Logo(
                      onboardingScreen: false,
                      tabletScreen: false,
                    ),
                  ),
                  SizedBox(
                    height: 41,
                  ),
                  BoxResetPassword(),
                ],
              ),
              tablet: Stack(
                children: [
                  Opacity(
                    opacity: 0.7,
                    child: Image.asset(
                      'assets/images/login_background.jpeg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withOpacity(0),
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.7),
                            Colors.white.withOpacity(1),
                          ]),
                    ),
                  ),
                  Center(
                      child: Column(
                    children: [
                      Spacer(),
                      Logo(
                        onboardingScreen: false,
                        tabletScreen: true,
                      ),
                      Spacer(),
                      Text(
                        ForgotPassword.titleResetPassword,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(fontFamily: AppConstants.fontRegular),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        height: 547,
                        width: MediaQuery.of(context).size.width / 2,
                        child: BoxResetPassword(),
                      ),
                      Spacer(
                        flex: 2,
                      )
                    ],
                  ))
                ],
              )),
        ),
      ),
    );
  }
}

class BoxResetPassword extends StatefulWidget {
  @override
  _BoxResetPasswordState createState() => _BoxResetPasswordState();
}

class _BoxResetPasswordState extends State<BoxResetPassword> {
  final _email = TextEditingController();
  final UserRepository _user = UserRepository();
  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double sizeTitleResetPassword;
    double spacingHeadTitle;
    double spacingSubTitle;
    double spacingTextBox;
    double spacingButton;
    double widthSizeScreen = MediaQuery.of(context).size.width;
    double paddingScreen = 25;
    if (widthSizeScreen >= 650) {
      sizeTitleResetPassword = 40;
      spacingHeadTitle = 33;
      spacingSubTitle = 83;
      spacingTextBox = 100;
      spacingButton = 27.58;
    } else {
      sizeTitleResetPassword = 32;
      spacingHeadTitle = 0;
      spacingSubTitle = 23;
      spacingTextBox = 138;
      spacingButton = 53;
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingScreen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: spacingHeadTitle,
          ),
          Text(ForgotPassword.titleResetPassword,
              style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontSize: sizeTitleResetPassword,
                  color: ForgotPasswordColor.titleForgotColor)),
          SizedBox(
            height: spacingSubTitle,
          ),
          Text(ForgotPassword.subtitleResetPassword,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(fontSize: 15)),
          SizedBox(
            height: spacingTextBox,
          ),
          // Spacer(),
          Text(
            ForgotPassword.emailAddress,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontFamily: AppConstants.fontRegular,
                fontWeight: FontWeight.normal,
                color: ForgotPasswordColor.subTitleForgotColor,
                fontSize: 15),
          ),
          BlocBuilder<UsersBloc, UsersState>(
            builder: (context, state) {
              return TextField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                autofocus: true,
                onSubmitted: (_email) {
                  context.read<UsersBloc>().add(SubmitEmail(_email));
                },
                cursorColor: ForgotPasswordColor.underLineColor,
                decoration: InputDecoration(
                  errorText: setErrText(context, state),
                  contentPadding: EdgeInsets.only(top: 15, bottom: 5),
                  isDense: true,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: ForgotPasswordColor.underLineColor,
                      // color: checkColor(true) == true
                      //     ? ForgotPasswordColor.underLineColor
                      //     : Colors.red,
                      width: 2,
                    ),
                  ),
                ),
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontFamily: AppConstants.fontRegular,
                    // color: ForgotPasswordColor.subTitleForgotColor,
                    fontSize: 16.5),
              );
            },
          ),
          SizedBox(
            height: spacingButton,
          ),
          TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: ForgotPasswordColor.underLineColor,
                  minimumSize: Size(widthSizeScreen, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              onPressed: () {
                context.read<UsersBloc>().add(SubmitEmail(_email.text));
                // sendMess();
                // auth.sendPasswordResetEmail(email: _email.text);
              },
              child: Text(
                ForgotPassword.buttonSend,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: Colors.white),
              )),
        ],
      ),
    );
  }

  setErrText(context, state) {
    if (state is SubmitEmailFailure) {
      return 'Email is not valid!';
    }
    if (state is SubmitEmailSuccess) {
      _user
          .resetPassword(_email.text)
          .whenComplete(() => Navigator.of(context).pushNamed('/login'));
      // print(getData);
    }
  }
}
