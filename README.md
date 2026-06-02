# Book Library

A Flutter application for managing a personal book collection with local data persistence. Built as a hands-on exercise to demonstrate proficiency in Flutter UI development and SQLite database integration using the `sqflite` package.

---

## Overview

The application enables users to add books by entering a title and an author, browse their full collection in a scrollable list ordered from newest to oldest, and delete individual entries. All data is stored locally on the device using a SQLite database, so the collection persists across app restarts.

On launch, the app displays a splash screen for four seconds before navigating automatically to the main library screen.

---

## Tech Stack

| Technology | Role |
|---|---|
| Flutter | Cross-platform UI framework |
| Dart | Primary programming language |
| SQLite (sqflite) | Local on-device relational database |
| Material Design 3 | Design system and component library |
| path | Cross-platform path resolution for the database file |

---

## Project Structure

```
lib/
├── main.dart                      # Application entry point, theme configuration
├── models/
│   └── book.dart                  # Book data model (id, title, author)
├── database/
│   └── database_helper.dart       # Database access layer (singleton)
└── pages/
    ├── splash_page.dart           # Splash screen with timed navigation
    ├── book_library_page.dart     # Main screen — state management and orchestration
    └── widgets/
        ├── book_form.dart         # Input form widget
        └── book_list.dart         # List widget with delete functionality
```

---

## Architecture

The project follows a layered architecture with clear separation between the data, business logic, and presentation layers:

- **Data layer** — `DatabaseHelper` implements the singleton pattern to maintain a single database connection. It exposes three operations: insert, query all, and delete by ID.
- **Model layer** — The `Book` class is a plain Dart object with `toMap()` and `fromMap()` serialisation methods for reading and writing to SQLite.
- **Presentation layer** — `BookLibraryPage` is a stateful widget that holds the book list in memory and triggers UI rebuilds after each database operation. `BookForm` and `BookList` are stateless widgets that receive data and callbacks via constructor parameters, keeping them reusable and testable.

---

## Database Schema

A single SQLite table named `books` is created inside a local database file called `library.db`:

```sql
CREATE TABLE books (
  id     INTEGER PRIMARY KEY AUTOINCREMENT,
  title  TEXT NOT NULL,
  author TEXT NOT NULL
);
```

---

## Running the Project

Ensure Flutter is installed and a target device or emulator is available, then run:

```bash
flutter pub get
flutter run
```

The project is configured to support Android, iOS, Linux desktop, and Web targets.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
