import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/navigation/route_paths.dart';
import '../../../authentication/presentation/bloc/auth_bloc.dart';
import '../../../theme/presentation/bloc/theme_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          spacing: 20,
          children: [
            SwitchListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              enableFeedback: true,
              value: context.read<ThemeBloc>().state.themeMode == ThemeMode.dark
                  ? true
                  : false,
              onChanged: (value) {
                context.read<ThemeBloc>().add(ToggleTheme());
              },
              title: Text('Dark Mode'),
            ),
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthUnauthenticated) {
                  context.go(RoutePaths.getStarted.path);
                }
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                height: 45,
                child: MaterialButton(
                  elevation: 0,
                  color: Theme.of(context).colorScheme.error,
                  onPressed: () {
                    context.read<AuthBloc>().add(LogoutRequested());
                  },
                  child: Text(
                    'Logout',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
