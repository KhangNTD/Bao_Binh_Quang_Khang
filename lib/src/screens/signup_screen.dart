import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/src/blocs/bloc/signup_bloc.dart';
import 'package:mobile_app/src/blocs/bloc/signup_event.dart';
import 'package:mobile_app/src/blocs/bloc/signup_state.dart';
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
                                      fontFamily: 'Nunito',
                                      color: Color(0xff030F09),
                                      fontSize: 24)),
                        ],
                      ),
                    ),
                    BoxSignUp(context)
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
                                    fontFamily: 'Nunito',
                                    color: Color(0xff030F09),
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
                            child: BoxSignUp(context))
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
  final BuildContext context;
  BoxSignUp(this.context);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        signUp(state);
        return Padding(
            padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(SignUpText.subTitleCreateAccount,
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontFamily: 'Nunito',
                            color: Color(0xff606060),
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
                            fontFamily: 'Nunito',
                            color: Color(0xffA8A8A8),
                            fontSize: 14),
                      ),
                      TextField(
                        cursorColor: Color(0xff30BE76),
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff30BE76),
                              width: 2,
                            ),
                          ),
                          contentPadding: EdgeInsets.only(top: 15, bottom: 5),
                          isDense: true,
                        ),
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontFamily: 'Nunito',
                            color: Color(0xff030F09),
                            fontSize: 16),
                      ),
                      SizedBox(height: 30),
                      Text(SignUpText.email,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(
                                  fontFamily: 'Nunito',
                                  color: Color(0xffA8A8A8),
                                  fontSize: 14)),
                      
                          TextField(
                            controller: _emailController,
                            cursorColor: Color(0xff30BE76),
                            keyboardType: TextInputType.emailAddress,
                            onSubmitted: (email) => context
                                .read<SignupBloc>()
                                .add(UserEmailSubmitted(email)),
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff30BE76),
                                  width: 2,
                                ),
                              ),
                              contentPadding:
                                  EdgeInsets.only(top: 15, bottom: 5),
                              isDense: true,
                              errorText: setErrorText(
                                state,
                                'mail',
                              ),
                            ),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontFamily: 'Nunito',
                                    color: Color(0xff030F09),
                                    fontSize: 16),
                          ),
                      SizedBox(height: 30),
                      Text(SignUpText.password,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(
                                  fontFamily: 'Nunito',
                                  color: Color(0xffA8A8A8),
                                  fontSize: 14)),
                      
                          
                           TextField(
                            controller: _passwordController,
                            cursorColor: Color(0xff30BE76),
                            obscureText: true,
                            onSubmitted: (value) => context
                                .read<SignupBloc>()
                                .add(UserPasswordSubmitted(value)),
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff30BE76),
                                  width: 2,
                                ),
                              ),
                              contentPadding:
                                  EdgeInsets.only(top: 15, bottom: 5),
                              isDense: true,
                              errorText: setErrorText(
                                state,
                                'pass',
                              ),
                            ),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontFamily: 'Nunito',
                                    color: Color(0xff030F09),
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
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xff30BE76)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                      ),
                      onPressed: () => context.read<SignupBloc>().add(
                          UserSignupButtonSubmitted(
                              _emailController.text.trim(),
                              _passwordController.text)),
                      // signUp(context),
                      child: Text(
                        SignUpText.buttonCreateAccount,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontFamily: 'Nunito',
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
                                    fontFamily: 'Nunito',
                                    color: Color(0xffA8A8A8),
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
                                    fontFamily: 'Nunito-Bold',
                                    color: Color(0xff30BE76),
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

  String? setErrorText(
    state,
    field,
  ) {
    if (state is UserEmailSubmitFailure && field == 'mail') {
      isValidEmail = false;
      return 'Invalid email';
    } else if (state is UserPasswordSubmitFailure && field == 'pass') {
      isValidPassword = false;
      return 'Password should have more than 8 characters,\nincluding number, lower and upper character,\nand special symbol.';
    } else if (state is UserEmailSubmitSuccess) {
      isValidEmail = true;
    } else if (state is UserPasswordSubmitSuccess) {
      isValidPassword = true;
    } else if (state is UserLoginFailure) {
      return state.exception;
    }
    return null;
  }

  void signUp( state) {
    if (state is UserLoginSuccess) {
      Navigator.pushReplacementNamed(context, '/login');
      // Navigator.of(context).pushNmed('/login');
    }
  }
}
