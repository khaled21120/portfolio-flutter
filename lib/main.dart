import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/services/prefs_service.dart';
import 'features/splash/splash_view.dart';
import 'core/networking/supabase_service.dart';
import 'core/theme/cubit/theme_cubit.dart';
import 'core/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ScreenUtil.ensureScreenSize();
  await dotenv.load(fileName: kIsWeb ? 'assets/env/env_web.env' : '.env');
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
      builder: (context, constraints) {
        final designSize = _getDesignSize(constraints.maxWidth);
        final textScale = _getTextScale(constraints.maxWidth);

        return ScreenUtilInit(
          designSize: designSize,
          minTextAdapt: true,
          splitScreenMode: true,
          useInheritedMediaQuery: true,
          builder: (_, child) {
            return BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: AppTheme.light,
                  darkTheme: AppTheme.dark,
                  themeMode: state.themeMode,
                  title: 'Khaled Gamal - Portfolio',
                  builder: (context, child) {
                    return MediaQuery(
                      data: MediaQuery.of(
                        context,
                      ).copyWith(textScaler: TextScaler.linear(textScale)),
                      child: child!,
                    );
                  },
                  // Remove ConstrainedBox from home to allow full width for splash
                  home: const ProfessionalSplashScreen(),
                );
              },
            );
          },
        );
      },
    );
  }

  Size _getDesignSize(double screenWidth) {
    if (screenWidth < 600) {
      return const Size(390, 844);
    } else if (screenWidth < 1100) {
      return const Size(1024, 768);
    } else {
      return const Size(1440, 1024);
    }
  }

  double _getTextScale(double width) {
    if (width < 600) {
      return 1.0;
    } else if (width < 1100) {
      return 1.05;
    } else {
      return 1.1;
    }
  }
}
