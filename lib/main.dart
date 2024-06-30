import 'package:flutter/material.dart';
import 'package:stack_my_money_app/src/utils/theme/theme.dart';

import 'src/routing/app_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Stack My Money",
        theme: SAppTheme.lightTheme,
        darkTheme: SAppTheme.darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: _appRouter.onGenerateRoute,
        );
  }

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }
}

