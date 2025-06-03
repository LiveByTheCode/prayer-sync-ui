import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prayer_sync/providers/auth_provider.dart';
import 'package:prayer_sync/providers/prayer_provider.dart';
import 'package:prayer_sync/screens/prayer_lists_screen.dart';
import 'package:prayer_sync/screens/all_requests_screen.dart';
import 'package:prayer_sync/screens/profile_screen.dart';
import 'package:prayer_sync/widgets/prayer_request_card.dart';
import 'package:prayer_sync/models/prayer_request.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardView(),
    const PrayerListsScreen(),
    const AllRequestsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final prayerProvider = context.watch<PrayerProvider>();
    final activeRequests = prayerProvider.getRequestsByStatus(RequestStatus.active);
    
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          const NavigationDestination(
            icon: Icon(Icons.list),
            label: 'Lists',
          ),
          NavigationDestination(
            icon: badges.Badge(
              showBadge: activeRequests.isNotEmpty,
              badgeContent: Text(
                activeRequests.length.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
              child: const Icon(Icons.self_improvement),
            ),
            label: 'Requests',
          ),
          const NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final prayerProvider = context.watch<PrayerProvider>();
    final activeRequests = prayerProvider.getRequestsByStatus(RequestStatus.active);
    final answeredRequests = prayerProvider.getRequestsByStatus(RequestStatus.answered);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, ${authProvider.currentUser?.displayName ?? 'Guest'}'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await prayerProvider.loadData();
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Prayer Statistics',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _StatCard(
                          title: 'Active',
                          count: activeRequests.length,
                          color: Colors.blue,
                          icon: Icons.pending,
                        ),
                        _StatCard(
                          title: 'Answered',
                          count: answeredRequests.length,
                          color: Colors.green,
                          icon: Icons.check_circle,
                        ),
                        _StatCard(
                          title: 'Lists',
                          count: prayerProvider.lists.length,
                          color: Colors.purple,
                          icon: Icons.list_alt,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Prayer Requests',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextButton(
                  onPressed: () {
                    DefaultTabController.of(context).animateTo(2);
                  },
                  child: const Text('See All'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            if (prayerProvider.requests.isEmpty)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    children: [
                      Icon(
                        Icons.self_improvement,
                        size: 64,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No prayer requests yet',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Add your first prayer request to get started',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
              ...prayerProvider.requests
                  .take(5)
                  .map((request) => PrayerRequestCard(
                        request: request,
                        onTap: () {},
                      )),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final int count;
  final Color color;
  final IconData icon;

  const _StatCard({
    required this.title,
    required this.count,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 32),
        ),
        const SizedBox(height: 8),
        Text(
          count.toString(),
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}