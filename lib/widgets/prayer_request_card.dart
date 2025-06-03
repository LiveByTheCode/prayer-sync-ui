import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:prayer_sync/models/prayer_request.dart';
import 'package:prayer_sync/providers/prayer_provider.dart';
import 'package:intl/intl.dart';

class PrayerRequestCard extends StatelessWidget {
  final PrayerRequest request;
  final VoidCallback onTap;

  const PrayerRequestCard({
    super.key,
    required this.request,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final prayerProvider = context.read<PrayerProvider>();
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) async {
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
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              icon: Icons.self_improvement,
              label: 'Pray',
            ),
            if (!request.isAnswered)
              SlidableAction(
                onPressed: (_) {
                  _showAnsweredDialog(context);
                },
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                icon: Icons.check_circle,
                label: 'Answered',
              ),
            SlidableAction(
              onPressed: (_) async {
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Prayer request deleted'),
                      ),
                    );
                  }
                }
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Card(
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _buildPriorityIndicator(),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              request.subject,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              request.requestDetail,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
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
                      if (request.prayerCount > 0)
                        _buildChip(
                          context,
                          'Prayed ${request.prayerCount}x',
                          Icons.self_improvement,
                          Colors.purple,
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'By ${request.requestorName}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        DateFormat.yMMMd().format(request.dateAdded),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPriorityIndicator() {
    Color color;
    switch (request.priority) {
      case RequestPriority.high:
        color = Colors.red;
        break;
      case RequestPriority.medium:
        color = Colors.orange;
        break;
      case RequestPriority.low:
        color = Colors.green;
        break;
    }

    return Container(
      width: 4,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget _buildChip(
      BuildContext context, String label, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
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
}