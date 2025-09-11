import 'package:flutter/material.dart';

class ApprovalDashboard extends StatefulWidget {
  const ApprovalDashboard({super.key});

  @override
  State<ApprovalDashboard> createState() => _ApprovalDashboardState();
}

class _ApprovalDashboardState extends State<ApprovalDashboard> {
  int _selectedTabIndex = 0;

  final List<String> statusTabs = [
    'Pending',
    'Approved',
    'Broker Review',
    'Completed',
    'Rejected',
  ];

  final Map<int, List<Map<String, dynamic>>> statusContent = {
    0: [ // Pending
      {
        'id': 'REQ-01',
        'AnimalName': 'Cattle',
        'service': 'Routine Checkup',
        'owner': 'Sarah Lungu',
        'vet': 'Dr. Smith',
        'submittedDate': 'Jan 15, 04:30PM',
        'priority': 'low priority',
        'status': 'Pending Approval',
        'description': 'Annual health checkup and vaccination update for Max. He\'s been healthy but due for his yearly exam.',
      },
    ],
    1: [ // Approved
      {
        'id': 'REQ-02',
        'AnimalName': 'Pig',
        'service': 'Vaccination',
        'owner': 'Mike Zulu',
        'vet': 'Dr. Johnson',
        'submittedDate': 'Jan 14, 02:15PM',
        'priority': 'medium priority',
        'status': 'Approved',
        'description': 'Rabies and DHPP vaccination approved. Owner has been notified to schedule appointment.',
      },
    ],
    2: [ // Broker Review
      {
        'id': 'REQ-03',
        'AnimalName': 'Goat',
        'service': 'Emergency Surgery',
        'owner': 'Lisa Tembo',
        'vet': 'Dr. Brown',
        'submittedDate': 'Jan 13, 11:45AM',
        'priority': 'high priority',
        'status': 'Broker Review',
        'description': 'Complex surgery case requiring specialist review. Insurance broker evaluating coverage options.',
      },
    ],
    3: [ // Completed
      {
        'id': 'REQ-04',
        'AnimalName': 'Horse',
        'service': 'Health Screening',
        'owner': 'David Banda',
        'vet': 'Dr. Wilson',
        'submittedDate': 'Jan 12, 09:30AM',
        'priority': 'low priority',
        'status': 'Completed',
        'description': 'Health screening completed successfully. All results normal. Follow-up scheduled in 6 months.',
      },
    ],
    4: [ // Rejected
      {
        'id': 'REQ-05',
        'AnimalName': 'Sheep',
        'service': 'Cosmetic Procedure',
        'owner': 'Emma Davis',
        'vet': 'Dr. Taylor',
        'submittedDate': 'Jan 11, 03:20PM',
        'priority': 'low priority',
        'status': 'Rejected',
        'description': 'Cosmetic procedure rejected due to medical necessity requirements not being met.',
      },
    ],
  };

  // Mock review data for pending requests
  final Map<String, Map<String, String>> mockReviewData = {
    'REQ-01': {
      'diagnosis': 'Mild anemia observed. Vital signs normal.',
      'treatment': 'Vitamin supplement administered. Monitor diet.',
      'recommendations': 'Recheck in 2 weeks. Ensure proper nutrition.',
      'followUp': '2 weeks',
      'additionalNotes': 'Animal is responding well to treatment.',
    },
  };

  void _handleReview(String reportId) {
    final review = mockReviewData[reportId];

    if (review != null) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 16,
              left: 16,
              right: 16,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Report Review', style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 16),
                  _buildReviewField('Diagnosis', review['diagnosis']!),
                  const SizedBox(height: 12),
                  _buildReviewField('Treatment Provided', review['treatment']!),
                  const SizedBox(height: 12),
                  _buildReviewField('Recommendations', review['recommendations']!),
                  const SizedBox(height: 12),
                  _buildReviewField('Follow-up Required', review['followUp']!),
                  const SizedBox(height: 12),
                  _buildReviewField('Additional Notes', review['additionalNotes']!),
                  const SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No review data available for $reportId')),
      );
    }
  }

  Widget _buildReviewField(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(value),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentItems = statusContent[_selectedTabIndex] ?? [];

    return Column(
      children: [
        // Status Tabs
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: statusTabs.asMap().entries.map((entry) {
                final index = entry.key;
                final title = entry.value;
                final isSelected = _selectedTabIndex == index;

                return Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTabIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Theme.of(context).colorScheme.primary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        '$title (${statusContent[index]?.length ?? 0})',
                        style: TextStyle(
                          color: isSelected
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.onSurface,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Items List
        if (currentItems.isEmpty)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  Icon(
                    Icons.inbox_outlined,
                    size: 48,
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No items in this category',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          ...currentItems.map((item) => Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
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
                              (item['AnimalName'] as String).substring(0, 1),
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
                                '${item['AnimalName']} - ${item['service']}',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Owner: ${item['owner']} • Vet: ${item['vet']}',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    size: 16,
                                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Submitted ${item['submittedDate']}',
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      item['id'] as String,
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        item['description'] as String,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                item['priority'] as String,
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.secondary,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: _getStatusColor(item['status'] as String),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                item['status'] as String,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (_selectedTabIndex == 0)
                          ElevatedButton(
                            onPressed: () => _handleReview(item['id'] as String),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            ),
                            child: const Text('Review'),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          ),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending approval':
        return Colors.orange;
      case 'approved':
        return Colors.green;
      case 'broker review':
        return Colors.blue;
      case 'completed':
        return Colors.green.shade700;
      case 'rejected':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
