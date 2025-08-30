import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vetcare_pro/screens/capture_report_screen.dart';
import 'theme/app_theme.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/requests_screen.dart';
import 'screens/history_screen.dart';
import 'screens/approvals_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/notifications_screen.dart';
import 'widgets/main_navigation.dart';

void main() {
  runApp(const ProviderScope(child: SafePasturesVetApp()));
}

class SafePasturesVetApp extends StatelessWidget {
  const SafePasturesVetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Safe Pastures Vet',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false, // Removed debug banner
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) => MainNavigation(child: child),
      routes: [
        GoRoute(
          path: '/dashboard',
          builder: (context, state) => const DashboardScreen(),
        ),
        GoRoute(
          path: '/requests',
          builder: (context, state) => const RequestsScreen(),
        ),
        GoRoute(
          path: '/history',
          builder: (context, state) => const HistoryScreen(),
        ),
        GoRoute(
          path: '/approvals',
          builder: (context, state) => const ApprovalsScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/notifications',
      builder: (context, state) => const NotificationsScreen(),
    ),
    GoRoute(
      path: '/capture',
      builder: (context, state) => const CaptureReportScreen(requestId: '',),
    ),
  ],
);
