import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/theme/presentation/bloc/theme_bloc.dart';

extension ThemeExtension on BuildContext {
  ThemeMode get themeMode => read<ThemeBloc>().state.themeMode;
}
