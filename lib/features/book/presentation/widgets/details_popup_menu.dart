import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../data/models/book_model.dart';
import '../bloc/book/book_bloc.dart';
import '../models/details_menu_option.dart';

class DetailsPopupMenu extends StatelessWidget {
  final BookModel book;

  const DetailsPopupMenu({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<DetailsMenuOption>(
      onSelected: (option) {
        switch (option) {
          case DetailsMenuOption.edit:
            Navigator.of(context).pushNamed(
              '/books/edit',
              arguments: {
                'book': book,
                'isFromSearch': false,
              },
            );
            break;
          case DetailsMenuOption.delete:
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    'Delete Book',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  content:
                      const Text('Are you sure you want to delete this Book?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        context
                            .read<BookBloc>()
                            .add(BookDeleteRequested(book.id));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Book Deleted'),
                          ),
                        );
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Delete',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
            break;
        }
      },
      itemBuilder: (BuildContext context) =>
          <PopupMenuEntry<DetailsMenuOption>>[
        PopupMenuItem<DetailsMenuOption>(
          value: DetailsMenuOption.edit,
          child: ListTile(
            tileColor: AppPallete.transparent,
            leading: const Icon(Icons.edit),
            title: Text(DetailsMenuOption.edit.readable),
          ),
        ),
        PopupMenuItem<DetailsMenuOption>(
          value: DetailsMenuOption.delete,
          child: ListTile(
            tileColor: AppPallete.transparent,
            leading: const Icon(Icons.delete),
            title: Text(DetailsMenuOption.delete.readable),
          ),
        ),
      ],
    );
  }
}
