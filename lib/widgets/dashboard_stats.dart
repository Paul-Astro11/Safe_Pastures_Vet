import 'package:flutter/material.dart';

class DashboardStats extends StatelessWidget {
  const DashboardStats({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = [
      {
        'title': 'Total Requests',
        'value': '27',
        'change': '+12% from last week',
        'icon': Icons.trending_up,
        'positive': true,
      },
      {
        'title': 'Pending Reviews',
        'value': '3',
        'change': '-2 from last week',
        'icon': Icons.access_time,
        'positive': true,
      },
      {
        'title': 'Completed Today',
        'value': '8',
        'change': '+4 from last week',
        'icon': Icons.check_circle_outline,
        'positive': true,
      },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // enables horizontal scrolling
      child: Row(
        children: stats.map((stat) {
          return Container(
            width: 220, // fixed width for each card
            margin: const EdgeInsets.only(right: 16), // spacing between cards
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          stat['title'] as String,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          stat['icon'] as IconData,
                          size: 16,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.7),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      stat['value'] as String,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      stat['change'] as String,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: (stat['positive'] as bool)
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
