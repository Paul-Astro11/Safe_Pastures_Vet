import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/dashboard_stats.dart';
import '../widgets/quick_actions.dart';
import '../widgets/recent_activity.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          const DashboardHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Page Title
                  Text(
                    'Manage requests',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Dashboard Stats
                  const DashboardStats(),
                  const SizedBox(height: 12),

                  // Quick Actions and Recent Activity
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 800) {
                        // Large screen: side by side
                        return const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: QuickActions()),
                            SizedBox(width: 16),
                            Expanded(child: RecentActivity()),
                          ],
                        );
                      } else {
                        // Small screen: stacked
                        return const Column(
                          children: [
                            QuickActions(),
                            SizedBox(height: 16),
                            RecentActivity(),
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
