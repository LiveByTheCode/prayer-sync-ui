import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prayer_sync/providers/prayer_provider.dart';
import 'package:prayer_sync/models/prayer_request.dart';
import 'package:intl/intl.dart';

class PrayerRequestDetailScreen extends StatelessWidget {
  final PrayerRequest request;

  const PrayerRequestDetailScreen({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    final prayerProvider = context.watch<PrayerProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Prayer Request'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) async {
              switch (value) {
                case 'edit':
                  // TODO: Navigate to edit screen
                  break;
                case 'delete':
                  final confirm = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Delete Prayer Request'),
                      content: const Text(
                          'Are you sure you want to delete this prayer request?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: const Text('Delete'),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  );

                  if (confirm == true && context.mounted) {
                    await prayerProvider.deletePrayerRequest(request.id);
                    if (context.mounted) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Prayer request deleted'),
                        ),
                      );
                    }
                  }
                  break;
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'edit',
                child: ListTile(
                  leading: Icon(Icons.edit),
                  title: Text('Edit'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              const PopupMenuItem(
                value: 'delete',
                child: ListTile(
                  leading: Icon(Icons.delete, color: Colors.red),
                  title: Text('Delete', style: TextStyle(color: Colors.red)),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          request.subject,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      _buildPriorityBadge(context),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    request.requestDetail,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildChip(
                        context,
                        _getCategoryName(request.category),
                        _getCategoryIcon(request.category),
                        Colors.blue,
                      ),
                      if (request.isAnswered)
                        _buildChip(
                          context,
                          'Answered',
                          Icons.check_circle,
                          Colors.green,
                        )
                      else
                        _buildChip(
                          context,
                          _getStatusName(request.status),
                          _getStatusIcon(request.status),
                          _getStatusColor(request.status),
                        ),
                      _buildChip(
                        context,
                        _getPrivacyName(request.privacyLevel),
                        Icons.privacy_tip,
                        Colors.purple,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Requested by'),
                  subtitle: Text(request.requestorName),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: const Text('Date Added'),
                  subtitle: Text(
                    DateFormat.yMMMMd().add_jm().format(request.dateAdded),
                  ),
                ),
                if (request.isAnswered && request.dateAnswered != null) ...[
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.check_circle, color: Colors.green),
                    title: const Text('Date Answered'),
                    subtitle: Text(
                      DateFormat.yMMMMd().add_jm().format(request.dateAnswered!),
                    ),
                  ),
                ],
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.self_improvement),
                  title: const Text('Prayer Count'),
                  subtitle: Text('${request.prayerCount} times'),
                  trailing: ElevatedButton.icon(
                    onPressed: () async {
                      await prayerProvider.incrementPrayerCount(request.id);
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Prayer count incremented'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Pray'),
                  ),
                ),
              ],
            ),
          ),
          if (request.scriptureReference != null) ...[
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                leading: const Icon(Icons.book),
                title: const Text('Scripture Reference'),
                subtitle: Text(request.scriptureReference!),
              ),
            ),
          ],
          if (request.isAnswered && request.howAnswered != null) ...[
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.celebration, color: Colors.green),
                        const SizedBox(width: 8),
                        Text(
                          'How God Answered',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(request.howAnswered!),
                  ],
                ),
              ),
            ),
          ],
          if (request.notes.isNotEmpty) ...[
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Notes & Updates',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    ...request.notes.map((note) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text('• $note'),
                        )),
                  ],
                ),
              ),
            ),
          ],
          if (request.tags.isNotEmpty) ...[
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tags',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: request.tags
                          .map((tag) => Chip(
                                label: Text(tag),
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
          const SizedBox(height: 80),
        ],
      ),
      floatingActionButton: !request.isAnswered
          ? FloatingActionButton.extended(
              onPressed: () => _showAnsweredDialog(context),
              icon: const Icon(Icons.check_circle),
              label: const Text('Mark as Answered'),
              backgroundColor: Colors.green,
            )
          : null,
    );
  }

  Widget _buildPriorityBadge(BuildContext context) {
    Color color;
    String text;
    
    switch (request.priority) {
      case RequestPriority.high:
        color = Colors.red;
        text = 'High Priority';
        break;
      case RequestPriority.medium:
        color = Colors.orange;
        text = 'Medium Priority';
        break;
      case RequestPriority.low:
        color = Colors.green;
        text = 'Low Priority';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildChip(
      BuildContext context, String label, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  void _showAnsweredDialog(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Mark as Answered'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'How was this prayer answered?',
            hintText: 'Describe how God answered this prayer...',
          ),
          maxLines: 3,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (controller.text.isNotEmpty) {
                await context
                    .read<PrayerProvider>()
                    .markAsAnswered(request.id, controller.text);
                if (context.mounted) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Prayer marked as answered'),
                    ),
                  );
                }
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  String _getCategoryName(RequestCategory category) {
    switch (category) {
      case RequestCategory.health:
        return 'Health';
      case RequestCategory.family:
        return 'Family';
      case RequestCategory.work:
        return 'Work';
      case RequestCategory.spiritualGrowth:
        return 'Spiritual Growth';
      case RequestCategory.relationships:
        return 'Relationships';
      case RequestCategory.finances:
        return 'Finances';
      case RequestCategory.ministry:
        return 'Ministry';
      case RequestCategory.other:
        return 'Other';
    }
  }

  IconData _getCategoryIcon(RequestCategory category) {
    switch (category) {
      case RequestCategory.health:
        return Icons.health_and_safety;
      case RequestCategory.family:
        return Icons.family_restroom;
      case RequestCategory.work:
        return Icons.work;
      case RequestCategory.spiritualGrowth:
        return Icons.church;
      case RequestCategory.relationships:
        return Icons.people;
      case RequestCategory.finances:
        return Icons.attach_money;
      case RequestCategory.ministry:
        return Icons.volunteer_activism;
      case RequestCategory.other:
        return Icons.category;
    }
  }

  String _getStatusName(RequestStatus status) {
    switch (status) {
      case RequestStatus.active:
        return 'Active';
      case RequestStatus.answered:
        return 'Answered';
      case RequestStatus.noLongerNeeded:
        return 'No Longer Needed';
      case RequestStatus.ongoing:
        return 'Ongoing';
    }
  }

  IconData _getStatusIcon(RequestStatus status) {
    switch (status) {
      case RequestStatus.active:
        return Icons.pending;
      case RequestStatus.answered:
        return Icons.check_circle;
      case RequestStatus.noLongerNeeded:
        return Icons.cancel;
      case RequestStatus.ongoing:
        return Icons.loop;
    }
  }

  Color _getStatusColor(RequestStatus status) {
    switch (status) {
      case RequestStatus.active:
        return Colors.orange;
      case RequestStatus.answered:
        return Colors.green;
      case RequestStatus.noLongerNeeded:
        return Colors.grey;
      case RequestStatus.ongoing:
        return Colors.blue;
    }
  }

  String _getPrivacyName(PrivacyLevel privacy) {
    switch (privacy) {
      case PrivacyLevel.private:
        return 'Private';
      case PrivacyLevel.church:
        return 'Church';
      case PrivacyLevel.public:
        return 'Public';
    }
  }
}