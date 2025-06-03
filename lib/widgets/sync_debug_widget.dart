import 'package:flutter/material.dart';
import 'package:prayer_sync/services/sync_service.dart';

class SyncDebugWidget extends StatelessWidget {
  const SyncDebugWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Debug Sync Controls',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  debugPrint('🔘 Manual sync trigger requested');
                  SyncService.instance.syncAfterLocalChange();
                },
                child: const Text('Trigger Sync'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  debugPrint('🔘 Full sync requested');
                  SyncService.instance.fullSync();
                },
                child: const Text('Full Sync'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          StreamBuilder<SyncStatus>(
            stream: SyncService.instance.syncStatus,
            builder: (context, snapshot) {
              final status = snapshot.data ?? SyncStatus.idle;
              return Row(
                children: [
                  const Text('Status: '),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getStatusColor(status),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      status.toString().split('.').last,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(SyncStatus status) {
    switch (status) {
      case SyncStatus.idle:
        return Colors.grey;
      case SyncStatus.syncing:
        return Colors.blue;
      case SyncStatus.synced:
        return Colors.green;
      case SyncStatus.error:
        return Colors.red;
    }
  }
}