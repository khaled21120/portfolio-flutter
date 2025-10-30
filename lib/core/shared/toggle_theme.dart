import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../theme/cubit/theme_cubit.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark =
        context.watch<ThemeCubit>().state.themeMode == ThemeMode.dark;

    return GestureDetector(
      onTap: () => context.read<ThemeCubit>().toggleTheme(),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (child, animation) => RotationTransition(
          turns: Tween(begin: 0.75, end: 1.0).animate(animation),
          child: FadeTransition(opacity: animation, child: child),
        ),
        child: Icon(
          isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
          key: ValueKey(isDark),
          color: isDark ? Colors.amber : Colors.blueGrey,
          size: 28,
        ),
      ),
    );
  }
}
