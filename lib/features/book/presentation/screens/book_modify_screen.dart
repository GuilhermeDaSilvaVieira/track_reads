import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:track_reads/core/utils/input_validators.dart';
import 'package:track_reads/features/book/data/models/book_model.dart';
import 'package:track_reads/features/book/domain/entities/book_status.dart';
import 'package:track_reads/features/book/presentation/bloc/book_bloc.dart';
import 'package:track_reads/features/book/presentation/models/book_form_model.dart';
import 'package:track_reads/features/book/presentation/utils/half_step_input_formatter.dart';
import 'package:track_reads/features/book/presentation/utils/image_validator.dart';

class BookModifyScreen extends StatefulWidget {
  final BookModel? book;
  const BookModifyScreen({super.key, this.book});

  @override
  State<BookModifyScreen> createState() => _BookModifyScreenState();
}

class _BookModifyScreenState extends State<BookModifyScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _olidController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _reviewController = TextEditingController();

  BookStatus _status = BookStatus.wishlist;
  String? _coverImageUrl;

  /// Helper function to get cover image URL from Open Library.
  void updateCoverImageUrl() {
    // The API returns a large cover image ("-L.jpg"). Adjust size code as needed.
    if (InputValidators.validateOLID(_olidController.text) == null) {
      setState(() => _coverImageUrl =
          'https://covers.openlibrary.org/b/olid/${_olidController.text}-L.jpg');
    } else {
      setState(() => _coverImageUrl = null);
    }
  }

  /// Extract OLID (Open Library ID) from an URL
  String extractOlid(String url) {
    final regex = RegExp(r'/b/olid/([^-/]+)');
    final match = regex.firstMatch(url);
    return match!.group(1)!;
  }

  @override
  void initState() {
    super.initState();
    _olidController.addListener(updateCoverImageUrl);

    if (widget.book != null) {
      _titleController.text = widget.book!.title;
      _authorController.text = widget.book!.author;
      _olidController.text = widget.book!.coverImageUrl != null
          ? extractOlid(widget.book!.coverImageUrl!)
          : '';
      _ratingController.text = widget.book!.rating?.toString() ?? '';
      _reviewController.text = widget.book!.review ?? '';
      _status = widget.book!.status;

      // Update the cover image URL based on the initial OLID
      updateCoverImageUrl();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _olidController.removeListener(updateCoverImageUrl);
    _titleController.dispose();
    _authorController.dispose();
    _olidController.dispose();
    _ratingController.dispose();
    _reviewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.book == null
            ? const Text('Add a new book')
            : const Text('Edit Book'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  textCapitalization: TextCapitalization.characters,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9]')),
                    TextInputFormatter.withFunction(
                      (oldValue, newValue) => TextEditingValue(
                        text: newValue.text.toUpperCase(),
                        selection: newValue.selection,
                      ),
                    )
                  ],
                  controller: _olidController,
                  decoration: const InputDecoration(
                    labelText: 'OLID (to retrieve cover image)',
                  ),
                ),
                const SizedBox(height: 16),
                DottedBorder(
                  borderType: BorderType.RRect,
                  dashPattern: [8, 4],
                  radius: const Radius.circular(12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FutureBuilder<bool>(
                      future:
                          ImageValidator.isImageTooSmall(_coverImageUrl ?? ''),
                      builder: (context, snapshot) {
                        // While checking, show a loading spinner or placeholder.
                        if (snapshot.connectionState != ConnectionState.done) {
                          return const SizedBox(
                            height: 200,
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                        // If image is too small or error occurred, show an error widget.
                        if (snapshot.hasData && snapshot.data == true) {
                          return Container(
                            height: 200,
                            color: Colors.grey[300],
                            child: const Center(
                              child: Text('Cover image not found'),
                            ),
                          );
                        }
                        // Else, display the image normally.
                        return CachedNetworkImage(
                          imageUrl: _coverImageUrl ?? '',
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Title field
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                  validator: InputValidators.validateTitle,
                ),
                const SizedBox(height: 8),
                // Author field
                TextFormField(
                  controller: _authorController,
                  decoration: const InputDecoration(labelText: 'Author'),
                  validator: InputValidators.validateAuthor,
                ),
                const SizedBox(height: 8),
                // Status field
                DropdownButtonFormField<BookStatus>(
                  decoration: const InputDecoration(labelText: 'Status'),
                  value: _status,
                  items: [
                    DropdownMenuItem(
                      value: BookStatus.finished,
                      child: Text(BookStatus.finished.readable),
                    ),
                    DropdownMenuItem(
                      value: BookStatus.inProgress,
                      child: Text(BookStatus.inProgress.readable),
                    ),
                    DropdownMenuItem(
                      value: BookStatus.wishlist,
                      child: Text(BookStatus.wishlist.readable),
                    ),
                    DropdownMenuItem(
                      value: BookStatus.abandoned,
                      child: Text(BookStatus.abandoned.readable),
                    ),
                  ],
                  onChanged: (value) => _status = value!,
                ),
                const SizedBox(height: 8),
                // Rating field
                TextField(
                  controller: _ratingController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: 'Enter Rating (0 - 5)',
                    hintText: 'e.g., 4.5',
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[.0-5]')),
                    HalfStepInputFormatter()
                  ],
                ),
                const SizedBox(height: 8),
                // Review field
                TextField(
                  controller: _reviewController,
                  minLines: 1,
                  maxLines: 150000,
                  decoration: const InputDecoration(
                    labelText: 'Enter Review',
                    hintText: 'Great book with an intense story...',
                  ),
                ),
                const SizedBox(height: 24),
                // Save Button
                ElevatedButton(
                  onPressed: () {
                    final isValid = _formKey.currentState?.validate() ?? false;

                    if (isValid) {
                      if (widget.book != null) {
                        final BookModel book = BookModel(
                          id: widget.book!.id,
                          creator: widget.book!.creator,
                          title: _titleController.text.trim(),
                          author: _authorController.text.trim(),
                          status: _status,
                          coverImageUrl: _coverImageUrl,
                          rating: _ratingController.text.trim().isNotEmpty
                              ? double.parse(_ratingController.text.trim())
                              : null,
                          review: _reviewController.text.trim().isNotEmpty
                              ? _reviewController.text.trim()
                              : null,
                        );

                        context.read<BookBloc>().add(BookUpdateRequested(book));
                        Navigator.of(context).pop();
                      } else {
                        final BookFormModel book = BookFormModel(
                          title: _titleController.text.trim(),
                          author: _authorController.text.trim(),
                          status: _status,
                          coverImageUrl: _coverImageUrl,
                          rating: _ratingController.text.trim().isNotEmpty
                              ? double.parse(_ratingController.text.trim())
                              : null,
                          review: _reviewController.text.trim().isNotEmpty
                              ? _reviewController.text.trim()
                              : null,
                        );

                        context
                            .read<BookBloc>()
                            .add(BookCreateRequested(book.toDomainEntity()));
                        Navigator.of(context).pop();
                      }
                    }
                  },
                  child: const Text('Save Book'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
