import 'package:flutter/material.dart';
import '../../domain/entities/book_status.dart';
import '../widgets/book_tab.dart';
import '../widgets/books_popup_menu.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TrackReads'),
          actions: [
            const BooksPopupMenu(),
          ],
        ),
        body: const TabBarView(
          children: [
            BookTab(status: BookStatus.finished),
            BookTab(status: BookStatus.inProgress),
            BookTab(status: BookStatus.wishlist),
            BookTab(status: BookStatus.abandoned),
          ],
        ),
        bottomNavigationBar: TabBar(
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          labelStyle: Theme.of(context).textTheme.labelMedium,
          tabs: [
            Tab(text: BookStatus.finished.readable),
            Tab(text: BookStatus.inProgress.readable),
            Tab(text: BookStatus.wishlist.readable),
            Tab(text: BookStatus.abandoned.readable),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              showDragHandle: true,
              context: context,
              builder: (context) {
                return Wrap(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.keyboard),
                      title: const Text('Add book manually'),
                      onTap: () {
                        Navigator.of(context).pushNamed('/books/add');
                      },
                    ),
                    ListTile(
                      enabled: false,
                      leading: const Icon(Icons.search),
                      title: const Text('Search in Open Library'),
                      onTap: () {},
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
