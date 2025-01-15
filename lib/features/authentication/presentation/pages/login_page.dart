import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../../../core/notifiers/theme_notifier.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late ThemeNotifier themeNotifier;
  bool _isPasswordVisible = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Form submitted successfully!")),
      );
    }
  }

  @override
  void didChangeDependencies() {
    themeNotifier = Provider.of<ThemeNotifier>(context);

    super.didChangeDependencies();
  }

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
                themeNotifier.themeMode == ThemeMode.light
                    ? Theme.of(context).colorScheme.primary.withAlpha(100)
                    : Colors.white12,
                themeNotifier.themeMode == ThemeMode.light
                    ? Theme.of(context).canvasColor
                    : Colors.transparent,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              stops: [
                0.0,
                themeNotifier.themeMode == ThemeMode.light ? 0.4 : 0.8,
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
                            color: themeNotifier.themeMode == ThemeMode.dark
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
                        // context.push('/login');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 5,
                        children: [
                          Icon(
                            LineIcons.googleLogo,
                            size: 30,
                            color: themeNotifier.themeMode == ThemeMode.dark
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
                            color: themeNotifier.themeMode == ThemeMode.dark
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
                  'Login',
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
