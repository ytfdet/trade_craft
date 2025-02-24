// lib/main.dart
import 'package:flutter/material.dart';

class DataDisplayScreen extends StatelessWidget {
  const DataDisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = {
      'name': 'John Doe',
      'phone': '+1 (555) 123-4567',
      'description': 'Senior Software Engineer with 5+ years of experience in mobile development. Passionate about creating user-friendly applications and solving complex problems.',
      'address': '123 Tech Street, Silicon Valley, CA 94025',
      'dateTime': DateTime.now().toString(),
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Details'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow('Name', data['name']!),
                const Divider(height: 1),
                _buildInfoRow('Phone', data['phone']!),
                const Divider(height: 1),
                _buildInfoRow('Address', data['address']!),
                const Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        data['description']!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                _buildInfoRow('Last Updated', data['dateTime']!),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
