import 'package:flutter/material.dart';
import '../../models/book.dart';

class BookList extends StatelessWidget {
  const BookList({super.key, required this.books, required this.onDelete});

  final List<Book> books;
  final void Function(int id) onDelete;

  @override
  Widget build(BuildContext context) {
    if (books.isEmpty) {
      return const Center(child: Text('Δεν υπάρχουν βιβλία ακόμη'));
    }

    return ListView.separated(
      itemCount: books.length,
      separatorBuilder: (_, _) => const Divider(),
      itemBuilder: (context, index) {
        final book = books[index];
        return ListTile(
          title: Text(
            book.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(book.author),
          trailing: IconButton(
            icon: const Icon(Icons.delete_outline),
            color: Colors.red,
            onPressed: () => onDelete(book.id!),
          ),
        );
      },
    );
  }
}
