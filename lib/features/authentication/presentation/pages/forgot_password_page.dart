import 'package:crypto_core/core/extensions/theme_extension.dart';
import 'package:crypto_core/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  // late ThemeNotifier themeNotifier;
  bool _isPasswordVisible = false;
  bool _isOtpSent = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthBloc>().add(
            ForgotPasswordRequested(_emailController.text),
          );
    }
  }

  // @override
  // void didChangeDependencies() {
  //   themeNotifier = Provider.of<ThemeNotifier>(context);

  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                context.themeMode == ThemeMode.light ? 0.4 : 0.8,
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
                            color: context.themeMode == ThemeMode.dark
                                ? Colors.white
                                : Colors.black87,
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
                'Reset Password',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 35),
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
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  spacing: 20,
                  children: [
                    !_isOtpSent
                        ? TextFormField(
                            controller: _emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Email is required";
                              }
                              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                  .hasMatch(value)) {
                                return "Enter a valid email";
                              }
                              return null;
                            },
                            style: Theme.of(context).textTheme.bodyMedium,
                            decoration: InputDecoration(
                              labelText: 'Email',
                            ),
                            keyboardType: TextInputType.emailAddress,
                          )
                        : Column(
                            spacing: 20,
                            children: [
                              TextFormField(
                                controller: _otpController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "OTP is required";
                                  }

                                  return null;
                                },
                                style: Theme.of(context).textTheme.bodyMedium,
                                decoration: InputDecoration(
                                  labelText: 'OTP',
                                ),
                                keyboardType: TextInputType.number,
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
                                  labelText: 'New password',
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordVisible =
                                            !_isPasswordVisible;
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
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 52,
              child: MaterialButton(
                elevation: 0,
                color: Theme.of(context).colorScheme.secondary,
                onPressed: () {
                  _submitForm();
                },
                child: Text(
                  'Submit',
                ),
              ),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
