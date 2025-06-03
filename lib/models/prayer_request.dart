import 'package:json_annotation/json_annotation.dart';

part 'prayer_request.g.dart';

enum RequestCategory {
  health,
  family,
  work,
  spiritualGrowth,
  relationships,
  finances,
  ministry,
  other
}

enum RequestPriority { high, medium, low }

enum RequestStatus { active, answered, noLongerNeeded, ongoing }

enum PrivacyLevel { private, church, public }

@JsonSerializable()
class PrayerRequest {
  final String id;
  final String? listId;
  final String? churchId;
  final DateTime dateAdded;
  final String subject;
  final String requestDetail;
  final bool isAnswered;
  final String? howAnswered;
  final DateTime? dateAnswered;
  final RequestCategory category;
  final RequestPriority priority;
  final String? scriptureReference;
  final List<String> notes;
  final String requestorId;
  final String requestorName;
  final PrivacyLevel privacyLevel;
  final List<String> tags;
  final RequestStatus status;
  final int prayerCount;
  final ReminderSettings? reminderSettings;
  final DateTime? lastModified;
  final String? syncId;

  PrayerRequest({
    required this.id,
    this.listId,
    this.churchId,
    required this.dateAdded,
    required this.subject,
    required this.requestDetail,
    this.isAnswered = false,
    this.howAnswered,
    this.dateAnswered,
    required this.category,
    required this.priority,
    this.scriptureReference,
    this.notes = const [],
    required this.requestorId,
    required this.requestorName,
    this.privacyLevel = PrivacyLevel.private,
    this.tags = const [],
    this.status = RequestStatus.active,
    this.prayerCount = 0,
    this.reminderSettings,
    this.lastModified,
    this.syncId,
  });

  factory PrayerRequest.fromJson(Map<String, dynamic> json) =>
      _$PrayerRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PrayerRequestToJson(this);

  PrayerRequest copyWith({
    String? id,
    String? listId,
    String? churchId,
    DateTime? dateAdded,
    String? subject,
    String? requestDetail,
    bool? isAnswered,
    String? howAnswered,
    DateTime? dateAnswered,
    RequestCategory? category,
    RequestPriority? priority,
    String? scriptureReference,
    List<String>? notes,
    String? requestorId,
    String? requestorName,
    PrivacyLevel? privacyLevel,
    List<String>? tags,
    RequestStatus? status,
    int? prayerCount,
    ReminderSettings? reminderSettings,
    DateTime? lastModified,
    String? syncId,
  }) {
    return PrayerRequest(
      id: id ?? this.id,
      listId: listId ?? this.listId,
      churchId: churchId ?? this.churchId,
      dateAdded: dateAdded ?? this.dateAdded,
      subject: subject ?? this.subject,
      requestDetail: requestDetail ?? this.requestDetail,
      isAnswered: isAnswered ?? this.isAnswered,
      howAnswered: howAnswered ?? this.howAnswered,
      dateAnswered: dateAnswered ?? this.dateAnswered,
      category: category ?? this.category,
      priority: priority ?? this.priority,
      scriptureReference: scriptureReference ?? this.scriptureReference,
      notes: notes ?? this.notes,
      requestorId: requestorId ?? this.requestorId,
      requestorName: requestorName ?? this.requestorName,
      privacyLevel: privacyLevel ?? this.privacyLevel,
      tags: tags ?? this.tags,
      status: status ?? this.status,
      prayerCount: prayerCount ?? this.prayerCount,
      reminderSettings: reminderSettings ?? this.reminderSettings,
      lastModified: lastModified ?? this.lastModified,
      syncId: syncId ?? this.syncId,
    );
  }
}

@JsonSerializable()
class ReminderSettings {
  final bool enabled;
  final List<int> daysOfWeek;
  final String time;
  final int? frequency;

  ReminderSettings({
    required this.enabled,
    this.daysOfWeek = const [],
    required this.time,
    this.frequency,
  });

  factory ReminderSettings.fromJson(Map<String, dynamic> json) =>
      _$ReminderSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$ReminderSettingsToJson(this);
}