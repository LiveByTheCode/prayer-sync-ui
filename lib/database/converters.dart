import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:prayer_sync/models/prayer_request.dart' as models;
import 'package:prayer_sync/models/prayer_list.dart' as models;
import 'package:prayer_sync/database/app_database.dart';

extension PrayerRequestDBExtension on PrayerRequest {
  models.PrayerRequest toDomainModel() {
    List<String> notesList = [];
    List<String> tagsList = [];
    
    try {
      notesList = List<String>.from(jsonDecode(notes));
    } catch (e) {
      notesList = notes.split(',').where((s) => s.isNotEmpty).toList();
    }
    
    try {
      tagsList = List<String>.from(jsonDecode(tags));
    } catch (e) {
      tagsList = tags.split(',').where((s) => s.isNotEmpty).toList();
    }

    models.ReminderSettings? reminderSettings;
    if (this.reminderSettings != null) {
      try {
        final json = jsonDecode(this.reminderSettings!);
        reminderSettings = models.ReminderSettings.fromJson(json);
      } catch (e) {
        // Handle parse error
      }
    }
    
    return models.PrayerRequest(
      id: id,
      listId: listId,
      churchId: churchId,
      dateAdded: dateAdded,
      subject: subject,
      requestDetail: requestDetail,
      isAnswered: isAnswered,
      howAnswered: howAnswered,
      dateAnswered: dateAnswered,
      category: models.RequestCategory.values.firstWhere(
        (e) => e.name == category,
        orElse: () => models.RequestCategory.other,
      ),
      priority: models.RequestPriority.values.firstWhere(
        (e) => e.name == priority,
        orElse: () => models.RequestPriority.medium,
      ),
      scriptureReference: scriptureReference,
      notes: notesList,
      requestorId: requestorId,
      requestorName: requestorName,
      privacyLevel: models.PrivacyLevel.values.firstWhere(
        (e) => e.name == privacyLevel,
        orElse: () => models.PrivacyLevel.private,
      ),
      tags: tagsList,
      status: models.RequestStatus.values.firstWhere(
        (e) => e.name == status,
        orElse: () => models.RequestStatus.active,
      ),
      prayerCount: prayerCount,
      reminderSettings: reminderSettings,
      lastModified: lastModified,
      syncId: syncId,
    );
  }
}

extension PrayerListDBExtension on PrayerList {
  models.PrayerList toDomainModel() {
    List<String> memberIdsList = [];
    
    try {
      memberIdsList = List<String>.from(jsonDecode(memberIds));
    } catch (e) {
      memberIdsList = memberIds.split(',').where((s) => s.isNotEmpty).toList();
    }
    
    return models.PrayerList(
      id: id,
      churchId: churchId,
      name: name,
      description: description,
      ownerId: ownerId,
      ownerName: ownerName,
      memberIds: memberIdsList,
      privacyLevel: models.PrivacyLevel.values.firstWhere(
        (e) => e.name == privacyLevel,
        orElse: () => models.PrivacyLevel.private,
      ),
      createdAt: createdAt,
      lastModified: lastModified,
      syncId: syncId,
      requestCount: requestCount,
      color: color,
      icon: icon,
    );
  }
}

extension PrayerRequestModelExtension on models.PrayerRequest {
  PrayerRequestsCompanion toCompanion() {
    return PrayerRequestsCompanion(
      id: Value(id),
      listId: Value(listId),
      churchId: Value(churchId),
      dateAdded: Value(dateAdded),
      subject: Value(subject),
      requestDetail: Value(requestDetail),
      isAnswered: Value(isAnswered),
      howAnswered: Value(howAnswered),
      dateAnswered: Value(dateAnswered),
      category: Value(category.name),
      priority: Value(priority.name),
      scriptureReference: Value(scriptureReference),
      notes: Value(jsonEncode(notes)),
      requestorId: Value(requestorId),
      requestorName: Value(requestorName),
      privacyLevel: Value(privacyLevel.name),
      tags: Value(jsonEncode(tags)),
      status: Value(status.name),
      prayerCount: Value(prayerCount),
      reminderSettings: Value(reminderSettings != null 
          ? jsonEncode(reminderSettings!.toJson())
          : null),
      lastModified: Value(lastModified),
      syncId: Value(syncId),
    );
  }
}

extension PrayerListModelExtension on models.PrayerList {
  PrayerListsCompanion toCompanion() {
    return PrayerListsCompanion(
      id: Value(id),
      churchId: Value(churchId),
      name: Value(name),
      description: Value(description),
      ownerId: Value(ownerId),
      ownerName: Value(ownerName),
      memberIds: Value(jsonEncode(memberIds)),
      privacyLevel: Value(privacyLevel.name),
      createdAt: Value(createdAt),
      lastModified: Value(lastModified),
      syncId: Value(syncId),
      requestCount: Value(requestCount),
      color: Value(color),
      icon: Value(icon),
    );
  }
}