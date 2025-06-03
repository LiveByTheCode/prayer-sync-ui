import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prayer_sync/providers/prayer_provider.dart';
import 'package:prayer_sync/models/prayer_list.dart';
import 'package:prayer_sync/models/prayer_request.dart';
import 'package:prayer_sync/screens/prayer_list_detail_screen.dart';
import 'package:prayer_sync/screens/add_prayer_list_screen.dart';

class PrayerListsScreen extends StatelessWidget {
  const PrayerListsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prayerProvider = context.watch<PrayerProvider>();
    final lists = prayerProvider.lists;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Prayer Lists'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddPrayerListScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: prayerProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : lists.isEmpty
              ? _buildEmptyState(context)
              : RefreshIndicator(
                  onRefresh: () async {
                    await prayerProvider.loadData();
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: lists.length,
                    itemBuilder: (context, index) {
                      final list = lists[index];
                      return _PrayerListCard(
                        list: list,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PrayerListDetailScreen(list: list),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddPrayerListScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.list_alt,
              size: 80,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No prayer lists yet',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Create your first prayer list to organize your requests',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddPrayerListScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.add),
              label: const Text('Create Prayer List'),
            ),
          ],
        ),
      ),
    );
  }
}

class _PrayerListCard extends StatelessWidget {
  final PrayerList list;
  final VoidCallback onTap;

  const _PrayerListCard({
    required this.list,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final prayerProvider = context.watch<PrayerProvider>();
    final requests = prayerProvider.getRequestsByList(list.id);
    final activeCount =
        requests.where((r) => r.status == RequestStatus.active).length;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: _getColorFromString(list.color)?.withValues(alpha: 0.1) ??
                      Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  _getIconFromString(list.icon) ?? Icons.list,
                  color: _getColorFromString(list.color) ??
                      Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      list.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    if (list.description != null &&
                        list.description!.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        list.description!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey[600],
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _buildChip(
                          context,
                          '$activeCount active',
                          Icons.pending,
                          Colors.orange,
                        ),
                        const SizedBox(width: 8),
                        _buildChip(
                          context,
                          '${list.requestCount} total',
                          Icons.format_list_numbered,
                          Colors.blue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Colors.grey[400],
              ),
            ],
          ),
        ),
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

  Color? _getColorFromString(String? colorString) {
    if (colorString == null) return null;
    switch (colorString) {
      case 'blue':
        return Colors.blue;
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'purple':
        return Colors.purple;
      case 'orange':
        return Colors.orange;
      default:
        return null;
    }
  }

  IconData _getIconFromString(String? iconString) {
    if (iconString == null) return Icons.list;
    switch (iconString) {
      case 'list':
        return Icons.list;
      case 'church':
        return Icons.groups;
      case 'family':
        return Icons.family_restroom;
      case 'work':
        return Icons.work;
      case 'health':
        return Icons.health_and_safety;
      default:
        return Icons.list;
    }
  }
}