import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/services/prefs_service.dart';
import 'features/splash/views/splash_view.dart';
import 'core/networking/supabase_service.dart';
import 'core/theme/cubit/theme_cubit.dart';
import 'core/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await dotenv.load(fileName: ".env");
  await PrefsService.init();
  await SupabaseService.initialize();
  final themeCubit = ThemeCubit();
  await themeCubit.loadTheme();

  runApp(BlocProvider.value(value: themeCubit, child: const PortfolioApp()));
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (__, constraints) {
        final designSize = _getDesignSize(constraints.maxWidth);
        return ScreenUtilInit(
          designSize: designSize,
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                return MaterialApp(
                  home: child,
                  debugShowCheckedModeBanner: false,
                  theme: AppTheme.light,
                  darkTheme: AppTheme.dark,
                  themeMode: state.themeMode,
                );
              },
            );
          },
          child: const SplashView(),
        );
      },
    );
  }

  Size _getDesignSize(double screenWidth) {
    if (screenWidth < 600) {
      return const Size(390, 844);
    } else if (screenWidth < 1200) {
      return const Size(834, 1112);
    } else {
      return const Size(1440, 1024);
    }
  }
}
