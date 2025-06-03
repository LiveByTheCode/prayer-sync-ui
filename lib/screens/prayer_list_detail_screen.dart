import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prayer_sync/providers/prayer_provider.dart';
import 'package:prayer_sync/models/prayer_list.dart';
import 'package:prayer_sync/models/prayer_request.dart';
import 'package:prayer_sync/widgets/prayer_request_card.dart';
import 'package:prayer_sync/screens/add_prayer_request_screen.dart';
import 'package:prayer_sync/screens/prayer_request_detail_screen.dart';

class PrayerListDetailScreen extends StatelessWidget {
  final PrayerList list;

  const PrayerListDetailScreen({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    final prayerProvider = context.watch<PrayerProvider>();
    final requests = prayerProvider.getRequestsByList(list.id);
    final activeRequests =
        requests.where((r) => r.status == RequestStatus.active).toList();
    final answeredRequests =
        requests.where((r) => r.status == RequestStatus.answered).toList();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(list.name),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Active'),
              Tab(text: 'Answered'),
              Tab(text: 'All'),
            ],
          ),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) async {
                switch (value) {
                  case 'edit':
                    // TODO: Navigate to edit list screen
                    break;
                  case 'delete':
                    final confirm = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Delete Prayer List'),
                        content: Text(
                          'Are you sure you want to delete "${list.name}"? '
                          'This will also delete all ${requests.length} prayer requests in this list.',
                        ),
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
                      await prayerProvider.deletePrayerList(list.id);
                      if (context.mounted) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Prayer list deleted'),
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
                    title: Text('Edit List'),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
                const PopupMenuItem(
                  value: 'delete',
                  child: ListTile(
                    leading: Icon(Icons.delete, color: Colors.red),
                    title: Text('Delete List', style: TextStyle(color: Colors.red)),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            if (list.description != null && list.description!.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Text(
                  list.description!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
              ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildRequestList(context, activeRequests),
                  _buildRequestList(context, answeredRequests),
                  _buildRequestList(context, requests),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddPrayerRequestScreen(listId: list.id),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildRequestList(BuildContext context, List<PrayerRequest> requests) {
    if (requests.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.volunteer_activism,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No prayer requests',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AddPrayerRequestScreen(listId: list.id),
                  ),
                );
              },
              icon: const Icon(Icons.add),
              label: const Text('Add Prayer Request'),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        await context.read<PrayerProvider>().loadData();
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: requests.length,
        itemBuilder: (context, index) {
          final request = requests[index];
          return PrayerRequestCard(
            request: request,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PrayerRequestDetailScreen(
                    request: request,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}