import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/pending_requests_list.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});

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
                  // Back button and header
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => context.go('/dashboard'),
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pending Requests',
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,color: const Color(0xFFFFFFFF)
                              ),
                            ),
                            Text(
                              'Review and manage incoming veterinary service requests',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: const Color(0xFFFFFFFF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const PendingRequestsList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
