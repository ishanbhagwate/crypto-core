import 'package:crypto_core/common/navigation/route_paths.dart';
import 'package:crypto_core/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  // late ThemeNotifier themeNotifier;

  // @override
  // void didChangeDependencies() {
  //   themeNotifier = Provider.of<ThemeNotifier>(context);

  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                'assets/images/get_started.svg',
                width: MediaQuery.of(context).size.width * 0.95,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Text(
              'cryptocore',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Track Every Move, Stay Ahead in Crypto',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  context.push(RoutePaths.signup.path);
                },
                child: Text(
                  'Get Started',
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 55,
              child: MaterialButton(
                elevation: 0,
                // color: Colors.transparent,
                onPressed: () {
                  context.push(RoutePaths.login.path);
                },
                child: Text(
                  'Already have an account? Login',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
