import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/bookmark_model.dart';
import 'bookmark_event.dart';
import 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  final List<BookmarkModel> bookmarks = [];

  BookmarkBloc() : super(InitialBookmarkState()) {
    on(_onShowBookmarks);
    on(_onToggleBookmarkOn);
    on(_onToggleBookmarkOff);
  }

  void _onShowBookmarks(event, emit) {
    emit(BookmarkLoaded(bookmarks));
  }

  void _onToggleBookmarkOn(ToggleBookmarkOn event, emit) {
    bookmarks.add(event.bookmark);
  }

  void _onToggleBookmarkOff(ToggleBookmarkOff event, emit) {
    for (final bookmark in bookmarks) {
      if (bookmark.content.title == event.bookmark.content.title) {
        bookmarks.removeWhere(
          (e) => e.content.title == event.bookmark.content.title,
        );
      }
    }
  }
}
