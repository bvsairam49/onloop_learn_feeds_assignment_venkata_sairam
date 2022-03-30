import '../model/bookmark_model.dart';

abstract class BookmarkState {
  List<BookmarkModel> bookmarks;
  BookmarkState({this.bookmarks = const []});
}

class InitialBookmarkState extends BookmarkState {}

class BookmarkLoading extends BookmarkState {}

class BookmarkLoaded extends BookmarkState {
  BookmarkLoaded(List<BookmarkModel> content) : super(bookmarks: content);
}
