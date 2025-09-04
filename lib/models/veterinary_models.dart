class VeterinaryRequest {
  final String id;
  final String AnimalName;
  final String AnimalType;
  final String breed;
  final String service;
  final String ownerName;
  final String ownerPhone;
  final String ownerEmail;
  final String clinic;
  final String vetName;
  final DateTime submittedDate;
  final String priority;
  final RequestStatus status;
  final String description;

  const VeterinaryRequest({
    required this.id,
    required this.AnimalName,
    required this.AnimalType,
    required this.breed,
    required this.service,
    required this.ownerName,
    required this.ownerPhone,
    required this.ownerEmail,
    required this.clinic,
    required this.vetName,
    required this.submittedDate,
    required this.priority,
    required this.status,
    required this.description,
  });
}

enum RequestStatus {
  pending,
  approved,
  brokerReview,
  completed,
  rejected,
}

class VeterinaryReport {
  final String id;
  final String requestId;
  final String diagnosis;
  final String treatment;
  final String recommendations;
  final String followUpRequired;
  final String additionalNotes;
  final List<String> imageUrls;
  final DateTime createdDate;

  const VeterinaryReport({
    required this.id,
    required this.requestId,
    required this.diagnosis,
    required this.treatment,
    required this.recommendations,
    required this.followUpRequired,
    required this.additionalNotes,
    required this.imageUrls,
    required this.createdDate,
  });
}

class NotificationItem {
  final String id;
  final String title;
  final String message;
  final NotificationType type;
  final DateTime timestamp;
  final bool isRead;

  const NotificationItem({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    required this.timestamp,
    required this.isRead,
  });
}

enum NotificationType {
  requestAccepted,
  reportSubmitted,
  approvalComplete,
  requestCompleted,
}
