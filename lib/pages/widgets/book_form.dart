import 'package:flutter/material.dart';

class BookForm extends StatelessWidget {
  const BookForm({
    super.key,
    required this.titleController,
    required this.authorController,
    required this.onSave,
  });

  final TextEditingController titleController;
  final TextEditingController authorController;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: titleController,
          decoration: const InputDecoration(labelText: 'Τίτλος Βιβλίου'),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: authorController,
          decoration: const InputDecoration(labelText: 'Συγγραφέας'),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: onSave,
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: const Text('Αποθήκευση'),
        ),
      ],
    );
  }
}
