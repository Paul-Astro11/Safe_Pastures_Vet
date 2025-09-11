import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/dashboard_header.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        'title': 'Request Accepted',
        'description':
        'Your request for Max (Golden Retriever) has been accepted by Dr. Smith',
        'time': '5m ago',
        'read': false,
        'type': 'success',
      },
      {
        'title': 'Report Submitted',
        'description':
        'Veterinary report for Luna (Persian Cat) has been submitted for approval',
        'time': '2h ago',
        'read': false,
        'type': 'info',
      },
      {
        'title': 'Approval Complete',
        'description':
        'Final approval completed for Buddy (Border Collie) - Claim approved for \$450.00',
        'time': '4h ago',
        'read': true,
        'type': 'success',
      },
    ];

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
                  // Back button and header
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => context.go('/dashboard'),
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Notifications',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Stay updated with your veterinary practice activities',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                Text('All notifications marked as read')),
                          );
                        },
                        child: const Text(
                          'Mark all read',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Notifications list
                  ...notifications.map((notification) => Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Card(
                      color: Colors.white, // 🔹 dark card for contrast
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: notification['read'] as bool
                                    ? Colors.transparent
                                    : Theme.of(context)
                                    .colorScheme
                                    .primary,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Icon(
                              notification['type'] == 'success'
                                  ? Icons.check_circle
                                  : notification['type'] == 'info'
                                  ? Icons.info
                                  : Icons.notifications,
                              color: notification['type'] == 'success'
                                  ? Colors.greenAccent
                                  : notification['type'] == 'info'
                                  ? Colors.lightBlueAccent
                                  : Theme.of(context)
                                  .colorScheme
                                  .primary,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    notification['title'] as String,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    notification['description'] as String,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    notification['time'] as String,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
