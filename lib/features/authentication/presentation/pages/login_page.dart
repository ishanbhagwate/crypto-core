import 'package:crypto_core/core/extensions/theme_extension.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:line_icons/line_icons.dart';

import '../../../../core/constants/api_constants.dart';
import '../bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // late ThemeNotifier themeNotifier;
  bool _isPasswordVisible = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthBloc>().add(
            LoginRequested(
              email: _emailController.text,
              password: _passwordController.text,
              isSocial: false,
            ),
          );
    }
  }

  // @override
  // void didChangeDependencies() {
  //   themeNotifier = Provider.of<ThemeNotifier>(context);

  //   super.didChangeDependencies();
  // }

  @override
  void initState() {
    super.initState();

    _googleSignIn.onCurrentUserChanged.listen(
      (GoogleSignInAccount? account) async {
        bool isAuthorized = account != null;

        if (isAuthorized) {
          //call API
          // ignore: use_build_context_synchronously
          context.read<AuthBloc>().add(
                LoginRequested(
                  email: account.email,
                  isSocial: true,
                  providerId: account.id,
                  provider: SocialProvider.google.name,
                ),
              );
        }
      },
    );
  }

  _googleLogin() async {
    try {
      await _googleSignIn.signIn();
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Something went wrong'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          // Navigate to the home page or desired route on successful login
          context.go('/');
        } else if (state is AuthError) {
          // Show an error message if signup fails
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.message,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  context.themeMode == ThemeMode.light
                      ? Theme.of(context).colorScheme.primary.withAlpha(100)
                      : Colors.white12,
                  context.themeMode == ThemeMode.light
                      ? Theme.of(context).canvasColor
                      : Colors.transparent,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                stops: [
                  0.0,
                  context.themeMode == ThemeMode.light
                      ? 0.4
                      : 0.8,
                ]),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SafeArea(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              style: BorderStyle.solid,
                              color: Theme.of(context).iconTheme.color!,
                            ),
                            borderRadius: BorderRadius.circular(100)),
                        child: Icon(
                          Icons.chevron_left,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Center(
                child: Text(
                  'Login',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 45),
                  textAlign: TextAlign.center,
                ),
              ),
              // SizedBox(
              //   height: 20,
              // ),
              // Text(
              //   'Sign up with',
              //   style: Theme.of(context).textTheme.bodyLarge,
              // ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  spacing: 15,
                  children: [
                    Expanded(
                      child: MaterialButton(
                        height: 52,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        focusElevation: 0,
                        highlightElevation: 0,
                        color: Theme.of(context).cardTheme.color,
                        onPressed: () {
                          _googleLogin();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 5,
                          children: [
                            Icon(
                              LineIcons.googleLogo,
                              size: 30,
                              color:
                                  context.themeMode ==
                                          ThemeMode.dark
                                      ? Colors.red.shade400
                                      : Colors.red.shade600,
                            ),
                            Text(
                              'Google',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        height: 52,
                        elevation: 0,
                        highlightElevation: 0,
                        focusElevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        color: Theme.of(context).cardTheme.color,
                        onPressed: () {
                          // context.push('/login');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 5,
                          children: [
                            Icon(
                              LineIcons.facebookF,
                              size: 25,
                              color:
                                  context.themeMode ==
                                          ThemeMode.dark
                                      ? Colors.blue
                                      : Colors.blue.shade600,
                            ),
                            Text(
                              'Facebook',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'OR',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    spacing: 20,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email is required";
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password is required";
                          }
                          if (value.length < 6) {
                            return "Password must be at least 6 characters";
                          }
                          return null;
                        },
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                            icon: Icon(
                              !_isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                        obscureText: !_isPasswordVisible,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                elevation: 0,
                // color: Colors.transparent,
                onPressed: () {
                  context.push('/forgotPassword');
                },
                child: Text(
                  'Forgot password',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 52,
                      child: MaterialButton(
                        elevation: 0,
                        color: Theme.of(context).colorScheme.secondary,
                        onPressed: () {
                          _submitForm();
                        },
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                  }

                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 52,
                    child: MaterialButton(
                      elevation: 0,
                      color: Theme.of(context).colorScheme.secondary,
                      onPressed: () {
                        _submitForm();
                      },
                      child: Text(
                        'Login',
                      ),
                    ),
                  );
                },
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
