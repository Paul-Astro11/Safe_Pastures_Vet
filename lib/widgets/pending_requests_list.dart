import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PendingRequestsList extends StatelessWidget {
  const PendingRequestsList({super.key});

  @override
  Widget build(BuildContext context) {
    final requests = [
      {
        'id': 'REQ-001',
        'petName': 'Max',
        'breed': 'Golden Retriever',
        'service': 'Routine Checkup',
        'submittedDate': 'Jan 15, 12:30 PM',
        'priority': 'Low Priority',
        'priorityColor': Colors.grey,
        'owner': {
          'name': 'Sarah Johnson',
          'phone': '+1 (555) 123-4567',
          'email': 'sarah.johnson@email.com',
          'location': 'Downtown Clinic',
        },
        'description': 'Annual health checkup and vaccination update for Max. He\'s been healthy but due for his yearly exam.',
        'petInfo': {
          'type': 'Dog',
          'breed': 'Golden Retriever',
        },
      },
      {
        'id': 'REQ-002',
        'petName': 'Luna',
        'breed': 'Persian',
        'service': 'Emergency Consultation',
        'submittedDate': 'Jan 15, 10:15 AM',
        'priority': 'High Priority',
        'priorityColor': Theme.of(context).colorScheme.error,
        'owner': {
          'name': 'Mike Chen',
          'phone': '+1 (555) 987-6543',
          'email': 'mike.chen@email.com',
          'location': 'Emergency Center',
        },
        'description': 'Luna has been vomiting and seems lethargic since yesterday evening. Owner is very concerned.',
        'petInfo': {
          'type': 'Cat',
          'breed': 'Persian',
        },
      },
      {
        'id': 'REQ-003',
        'petName': 'Buddy',
        'breed': 'Border Collie',
        'service': 'Behavioral Assessment',
        'submittedDate': 'Jan 14, 06:45 PM',
        'priority': 'Medium Priority',
        'priorityColor': Theme.of(context).colorScheme.primary,
        'owner': {
          'name': 'Emily Rodriguez',
          'phone': '+1 (555) 456-7890',
          'email': 'emily.rodriguez@email.com',
          'location': 'Behavioral Clinic',
        },
        'description': 'Buddy has been showing aggressive behavior towards other dogs during walks. Need professional assessment.',
        'petInfo': {
          'type': 'Dog',
          'breed': 'Border Collie',
        },
      },
    ];

    return Column(
      children: requests.map((request) => Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with pet info and badges
                Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                        child: Text(
                          (request['petName'] as String).substring(0, 1),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${request['petName']} - ${request['breed']}',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${request['service']} • Submitted ${request['submittedDate']}',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                
                // Priority and ID badges
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: request['priorityColor'] as Color,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        request['priority'] as String,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        request['id'] as String,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Content in responsive layout
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 600) {
                      // Large screen: side by side
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _buildPetInfo(context, request)),
                          const SizedBox(width: 24),
                          Expanded(child: _buildOwnerContact(context, request)),
                        ],
                      );
                    } else {
                      // Small screen: stacked
                      return Column(
                        children: [
                          _buildPetInfo(context, request),
                          const SizedBox(height: 16),
                          _buildOwnerContact(context, request),
                        ],
                      );
                    }
                  },
                ),
                const SizedBox(height: 16),

                // Action buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                           context.go('/capture');
                        },
                        child: const Text('Accept Request'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Rejecting request ${request['id']}'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.error,
                          foregroundColor: Theme.of(context).colorScheme.onError,
                        ),
                        child: const Text('Reject Request'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )).toList(),
    );
  }

  Widget _buildPetInfo(BuildContext context, Map<String, dynamic> request) {
    final petInfo = request['petInfo'] as Map<String, dynamic>;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pet Information',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Type: ${petInfo['type']}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text(
          'Breed: ${petInfo['breed']}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 16),
        Text(
          'Description',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          request['description'] as String,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildOwnerContact(BuildContext context, Map<String, dynamic> request) {
    final owner = request['owner'] as Map<String, dynamic>;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Owner Contact',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.phone, size: 16),
            const SizedBox(width: 8),
            Text(
              owner['phone'] as String,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(Icons.email, size: 16),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                owner['email'] as String,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(Icons.location_on, size: 16),
            const SizedBox(width: 8),
            Text(
              owner['location'] as String,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }
}
