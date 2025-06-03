import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prayer_sync/providers/prayer_provider.dart';
import 'package:prayer_sync/providers/auth_provider.dart';
import 'package:prayer_sync/models/prayer_request.dart';

class AddPrayerRequestScreen extends StatefulWidget {
  final String? listId;
  
  const AddPrayerRequestScreen({super.key, this.listId});

  @override
  State<AddPrayerRequestScreen> createState() => _AddPrayerRequestScreenState();
}

class _AddPrayerRequestScreenState extends State<AddPrayerRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  final _subjectController = TextEditingController();
  final _detailController = TextEditingController();
  final _scriptureController = TextEditingController();
  final _tagsController = TextEditingController();
  
  RequestCategory _selectedCategory = RequestCategory.other;
  RequestPriority _selectedPriority = RequestPriority.medium;
  PrivacyLevel _selectedPrivacy = PrivacyLevel.private;
  String? _selectedListId;
  
  @override
  void initState() {
    super.initState();
    _selectedListId = widget.listId;
  }
  
  @override
  void dispose() {
    _subjectController.dispose();
    _detailController.dispose();
    _scriptureController.dispose();
    _tagsController.dispose();
    super.dispose();
  }
  
  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      final authProvider = context.read<AuthProvider>();
      final prayerProvider = context.read<PrayerProvider>();
      
      final tags = _tagsController.text
          .split(',')
          .map((tag) => tag.trim())
          .where((tag) => tag.isNotEmpty)
          .toList();
      
      final request = PrayerRequest(
        id: '',
        listId: _selectedListId,
        dateAdded: DateTime.now(),
        subject: _subjectController.text,
        requestDetail: _detailController.text,
        category: _selectedCategory,
        priority: _selectedPriority,
        scriptureReference: _scriptureController.text.isEmpty 
            ? null 
            : _scriptureController.text,
        requestorId: authProvider.currentUser?.id ?? 'guest',
        requestorName: authProvider.currentUser?.displayName ?? 'Guest',
        privacyLevel: _selectedPrivacy,
        tags: tags,
      );
      
      try {
        await prayerProvider.addPrayerRequest(request);
        if (mounted) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Prayer request added successfully'),
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${e.toString()}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final prayerProvider = context.watch<PrayerProvider>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Prayer Request'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _subjectController,
              decoration: const InputDecoration(
                labelText: 'Subject',
                hintText: 'Who or what is this prayer for?',
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a subject';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _detailController,
              decoration: const InputDecoration(
                labelText: 'Prayer Request Details',
                hintText: 'Describe the prayer request...',
                prefixIcon: Icon(Icons.description),
              ),
              maxLines: 4,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter prayer details';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String?>(
              value: _selectedListId,
              decoration: const InputDecoration(
                labelText: 'Prayer List (Optional)',
                prefixIcon: Icon(Icons.list),
              ),
              items: [
                const DropdownMenuItem(
                  value: null,
                  child: Text('No List'),
                ),
                ...prayerProvider.lists.map((list) {
                  return DropdownMenuItem(
                    value: list.id,
                    child: Text(list.name),
                  );
                }),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedListId = value;
                });
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<RequestCategory>(
              value: _selectedCategory,
              decoration: const InputDecoration(
                labelText: 'Category',
                prefixIcon: Icon(Icons.category),
              ),
              items: RequestCategory.values.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(_getCategoryName(category)),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedCategory = value;
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<RequestPriority>(
              value: _selectedPriority,
              decoration: const InputDecoration(
                labelText: 'Priority',
                prefixIcon: Icon(Icons.priority_high),
              ),
              items: RequestPriority.values.map((priority) {
                return DropdownMenuItem(
                  value: priority,
                  child: Text(_getPriorityName(priority)),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedPriority = value;
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<PrivacyLevel>(
              value: _selectedPrivacy,
              decoration: const InputDecoration(
                labelText: 'Privacy Level',
                prefixIcon: Icon(Icons.privacy_tip),
              ),
              items: PrivacyLevel.values.map((privacy) {
                return DropdownMenuItem(
                  value: privacy,
                  child: Text(_getPrivacyName(privacy)),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedPrivacy = value;
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _scriptureController,
              decoration: const InputDecoration(
                labelText: 'Scripture Reference (Optional)',
                hintText: 'e.g., Philippians 4:6',
                prefixIcon: Icon(Icons.book),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _tagsController,
              decoration: const InputDecoration(
                labelText: 'Tags (Optional)',
                hintText: 'Separate tags with commas',
                prefixIcon: Icon(Icons.tag),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _submit,
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Text('Add Prayer Request'),
              ),
            ),
          ],
        ),
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
  
  String _getPrivacyName(PrivacyLevel privacy) {
    switch (privacy) {
      case PrivacyLevel.private:
        return 'Private (Only Me)';
      case PrivacyLevel.church:
        return 'Church Members';
      case PrivacyLevel.public:
        return 'Public';
    }
  }
}