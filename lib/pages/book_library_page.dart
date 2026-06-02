import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../models/book.dart';
import 'widgets/book_form.dart';
import 'widgets/book_list.dart';

class BookLibraryPage extends StatefulWidget {
  const BookLibraryPage({super.key});

  @override
  State<BookLibraryPage> createState() => _BookLibraryPageState();
}

class _BookLibraryPageState extends State<BookLibraryPage> {
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  List<Book> _books = [];

  @override
  void initState() {
    super.initState();
    _refreshBooks();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    super.dispose();
  }

  Future<void> _refreshBooks() async {
    final data = await DatabaseHelper.instance.getBooks();
    setState(() => _books = data);
  }

  Future<void> _deleteBook(int id) async {
    await DatabaseHelper.instance.deleteBook(id);
    await _refreshBooks();
  }

  Future<void> _saveBook() async {
    final title = _titleController.text.trim();
    final author = _authorController.text.trim();

    if (title.isEmpty || author.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Συμπληρώστε τίτλο και συγγραφέα')),
      );
      return;
    }

    await DatabaseHelper.instance.insertBook(
      Book(title: title, author: author),
    );
    _titleController.clear();
    _authorController.clear();
    if (!mounted) return;
    FocusScope.of(context).unfocus();
    await _refreshBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Καταχώρηση Βιβλίων'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BookForm(
              titleController: _titleController,
              authorController: _authorController,
              onSave: _saveBook,
            ),
            const SizedBox(height: 16),
            const Divider(),
            Expanded(child: BookList(books: _books, onDelete: _deleteBook)),
          ],
        ),
      ),
    );
  }
}
