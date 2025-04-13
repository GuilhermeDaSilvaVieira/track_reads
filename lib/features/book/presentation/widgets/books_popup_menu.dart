import 'package:flutter/material.dart';
import 'package:track_reads/features/book/presentation/models/books_menu_option.dart';

class BooksPopupMenu extends StatelessWidget {
  const BooksPopupMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<BooksMenuOption>(
      onSelected: (option) {
        switch (option) {
          case BooksMenuOption.sort:
            // Implement sort functionality
            break;
          case BooksMenuOption.filter:
            // Implement filter functionality
            break;
          case BooksMenuOption.switchTheme:
            // Implement theme switch functionality
            break;
          case BooksMenuOption.settings:
            // Navigate to settings page
            break;
          case BooksMenuOption.logout:
            // Implement logout functionality
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<BooksMenuOption>>[
        PopupMenuItem<BooksMenuOption>(
          enabled: false,
          value: BooksMenuOption.sort,
          child: ListTile(
            leading: const Icon(Icons.sort),
            title: Text(BooksMenuOption.sort.readable),
          ),
        ),
        PopupMenuItem<BooksMenuOption>(
          enabled: false,
          value: BooksMenuOption.filter,
          child: ListTile(
            leading: const Icon(Icons.filter_list),
            title: Text(BooksMenuOption.filter.readable),
          ),
        ),
        PopupMenuItem<BooksMenuOption>(
          enabled: false,
          value: BooksMenuOption.switchTheme,
          child: ListTile(
            leading: const Icon(Icons.brightness_6),
            title: Text(BooksMenuOption.switchTheme.readable),
          ),
        ),
        PopupMenuItem<BooksMenuOption>(
          enabled: false,
          value: BooksMenuOption.settings,
          child: ListTile(
            leading: const Icon(Icons.settings),
            title: Text(BooksMenuOption.settings.readable),
          ),
        ),
        PopupMenuItem<BooksMenuOption>(
          enabled: false,
          value: BooksMenuOption.logout,
          child: ListTile(
            leading: const Icon(Icons.logout),
            title: Text(BooksMenuOption.logout.readable),
          ),
        ),
      ],
    );
  }
}
