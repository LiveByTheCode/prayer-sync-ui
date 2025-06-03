import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prayer_sync/providers/prayer_provider.dart';
import 'package:prayer_sync/models/prayer_request.dart';
import 'package:prayer_sync/widgets/prayer_request_card.dart';
import 'package:prayer_sync/screens/add_prayer_request_screen.dart';
import 'package:prayer_sync/screens/prayer_request_detail_screen.dart';

class AllRequestsScreen extends StatefulWidget {
  const AllRequestsScreen({super.key});

  @override
  State<AllRequestsScreen> createState() => _AllRequestsScreenState();
}

class _AllRequestsScreenState extends State<AllRequestsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';
  RequestCategory? _selectedCategory;
  RequestPriority? _selectedPriority;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<PrayerRequest> _filterRequests(List<PrayerRequest> requests) {
    return requests.where((request) {
      if (_searchQuery.isNotEmpty) {
        final query = _searchQuery.toLowerCase();
        if (!request.subject.toLowerCase().contains(query) &&
            !request.requestDetail.toLowerCase().contains(query)) {
          return false;
        }
      }
      
      if (_selectedCategory != null && request.category != _selectedCategory) {
        return false;
      }
      
      if (_selectedPriority != null && request.priority != _selectedPriority) {
        return false;
      }
      
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final prayerProvider = context.watch<PrayerProvider>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prayer Requests'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Active'),
            Tab(text: 'Answered'),
            Tab(text: 'Ongoing'),
            Tab(text: 'All'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilterDialog,
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddPrayerRequestScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search prayer requests...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _searchQuery = '';
                          });
                        },
                      )
                    : null,
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildRequestList(
                  _filterRequests(prayerProvider.getRequestsByStatus(RequestStatus.active)),
                ),
                _buildRequestList(
                  _filterRequests(prayerProvider.getRequestsByStatus(RequestStatus.answered)),
                ),
                _buildRequestList(
                  _filterRequests(prayerProvider.getRequestsByStatus(RequestStatus.ongoing)),
                ),
                _buildRequestList(
                  _filterRequests(prayerProvider.requests),
                ),
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
              builder: (context) => const AddPrayerRequestScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildRequestList(List<PrayerRequest> requests) {
    if (requests.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No prayer requests found',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
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
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 80),
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

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Filter Requests'),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<RequestCategory?>(
                    value: _selectedCategory,
                    decoration: const InputDecoration(
                      labelText: 'Category',
                    ),
                    items: [
                      const DropdownMenuItem(
                        value: null,
                        child: Text('All Categories'),
                      ),
                      ...RequestCategory.values.map((category) {
                        return DropdownMenuItem(
                          value: category,
                          child: Text(_getCategoryName(category)),
                        );
                      }),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<RequestPriority?>(
                    value: _selectedPriority,
                    decoration: const InputDecoration(
                      labelText: 'Priority',
                    ),
                    items: [
                      const DropdownMenuItem(
                        value: null,
                        child: Text('All Priorities'),
                      ),
                      ...RequestPriority.values.map((priority) {
                        return DropdownMenuItem(
                          value: priority,
                          child: Text(_getPriorityName(priority)),
                        );
                      }),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedPriority = value;
                      });
                    },
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _selectedCategory = null;
                  _selectedPriority = null;
                });
                Navigator.pop(context);
              },
              child: const Text('Clear'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                this.setState(() {});
              },
              child: const Text('Apply'),
            ),
          ],
        );
      },
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

  String _getPriorityName(RequestPriority priority) {
    switch (priority) {
      case RequestPriority.high:
        return 'High';
      case RequestPriority.medium:
        return 'Medium';
      case RequestPriority.low:
        return 'Low';
    }
  }
}