# 📚 TrackReads

**TrackReads** is a cross-platform Book Tracker app built with Flutter and Firebase. It helps users keep track of books they want to read, are currently reading, or have finished, with real-time syncing, book search, and review features.

https://github.com/user-attachments/assets/93dac6e8-e65d-4545-a93a-2c3c87dc0a66

## 🚀 Features (MVP Scope)
- 🔐 **Authentication** with Firebase (Email/Password)
- 📖 **Book Search** using Open Library API
- 🗂️ **Personal Reading Lists**
  - Want to Read
  - Currently Reading
  - Finished
- ⭐ **Ratings & Reviews** for books
- 🔁 **Real-time Sync** with Firebase Firestore
- 🎨 Dynamic Theme Switching (Light & Dark Mode)
- 📱 **Cross-platform** support for:
  - Android
  - iOS
  - Web

## 🛠️ Tech Stack
- **Flutter**: Frontend (UI, multiplatform support)
- **BLoC**: State Management
- **Firebase Auth**: User authentication
- **Firestore**: Cloud NoSQL database for book data
- **Open Library API**: External book data (search, covers, metadata)

## 📐 Architecture
TrackReads is built using the Clean Architecture principles combined with a feature-first folder structure. This ensures scalability, testability, and separation of concerns across:

- Domain Layer (Entities, Repositories)
- Application Layer (Business Logic, Use Cases)
- Data Layer (Firebase, Open Library API integration, Data Transfer Objects)
- Presentation Layer (UI, BLoC, Widgets)

Each feature (e.g., Auth, Book) is self-contained and organized under its own directory for better maintainability and scalability.

## 📌 Project Status
- [x] Planning & Setup
- [x] Firebase Auth Integration
- [x] Firestore Collections for Book Lists
- [x] Open Library Search Integration
- [x] Ratings & Reviews
- [x] UI Polishing
- [x] Final Testing

## Prerequisites

- Install [Flutter SDK](https://flutter.dev/docs/get-started/install) on your machine.
- Install [Dart SDK](https://dart.dev/get-dart) if not included with Flutter installation.

## Version Used For Development
- **Flutter**: 3.27.1
- **Dart**: 3.6.0

## Installation

To get started with the app, follow the steps below:

1. Clone the repository:
   ```bash
   git clone https://github.com/guilhermedasilvavieira/track_reads.git
   ```

2. Navigate into the project directory:
   ```bash
   cd track_reads
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app on your device or simulator:
   ```bash
   flutter run --release
   ```

---

Stay tuned for more updates and features in the next version!
