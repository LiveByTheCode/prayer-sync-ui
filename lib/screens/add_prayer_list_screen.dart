import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prayer_sync/providers/prayer_provider.dart';
import 'package:prayer_sync/providers/auth_provider.dart';
import 'package:prayer_sync/models/prayer_list.dart';
import 'package:prayer_sync/models/prayer_request.dart';

class AddPrayerListScreen extends StatefulWidget {
  const AddPrayerListScreen({super.key});

  @override
  State<AddPrayerListScreen> createState() => _AddPrayerListScreenState();
}

class _AddPrayerListScreenState extends State<AddPrayerListScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  
  PrivacyLevel _selectedPrivacy = PrivacyLevel.private;
  String? _selectedColor = 'blue';
  String? _selectedIcon = 'list';
  
  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
  
  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      final authProvider = context.read<AuthProvider>();
      final prayerProvider = context.read<PrayerProvider>();
      
      final list = PrayerList(
        id: '',
        name: _nameController.text,
        description: _descriptionController.text.isEmpty 
            ? null 
            : _descriptionController.text,
        ownerId: authProvider.currentUser?.id ?? 'guest',
        ownerName: authProvider.currentUser?.displayName ?? 'Guest',
        privacyLevel: _selectedPrivacy,
        createdAt: DateTime.now(),
        color: _selectedColor,
        icon: _selectedIcon,
      );
      
      try {
        await prayerProvider.addPrayerList(list);
        if (mounted) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Prayer list created successfully'),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Prayer List'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'List Name',
                hintText: 'e.g., Family Prayers, Church Needs',
                prefixIcon: Icon(Icons.list),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a list name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description (Optional)',
                hintText: 'Brief description of this prayer list',
                prefixIcon: Icon(Icons.description),
              ),
              maxLines: 3,
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
            const SizedBox(height: 24),
            Text(
              'Choose Color',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              children: [
                _buildColorOption('blue', Colors.blue),
                _buildColorOption('red', Colors.red),
                _buildColorOption('green', Colors.green),
                _buildColorOption('purple', Colors.purple),
                _buildColorOption('orange', Colors.orange),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Choose Icon',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              children: [
                _buildIconOption('list', Icons.list),
                _buildIconOption('church', Icons.groups),
                _buildIconOption('family', Icons.family_restroom),
                _buildIconOption('work', Icons.work),
                _buildIconOption('health', Icons.health_and_safety),
              ],
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _submit,
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Text('Create Prayer List'),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildColorOption(String colorName, Color color) {
    final isSelected = _selectedColor == colorName;
    
    return InkWell(
      onTap: () {
        setState(() {
          _selectedColor = colorName;
        });
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: color.withOpacity(isSelected ? 1.0 : 0.2),
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? Border.all(color: color, width: 3)
              : null,
        ),
        child: isSelected
            ? const Icon(Icons.check, color: Colors.white)
            : null,
      ),
    );
  }
  
  Widget _buildIconOption(String iconName, IconData icon) {
    final isSelected = _selectedIcon == iconName;
    
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIcon = iconName;
        });
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
              : Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                )
              : null,
        ),
        child: Icon(
          icon,
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Colors.grey,
        ),
      ),
    );
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