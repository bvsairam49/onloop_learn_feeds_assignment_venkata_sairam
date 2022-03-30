import '../model/bookmark_model.dart';

abstract class BookmarkEvent {}

class ToggleBookmarkOn extends BookmarkEvent {
  final BookmarkModel bookmark;
  ToggleBookmarkOn({required this.bookmark});
}

class ToggleBookmarkOff extends BookmarkEvent {
  final BookmarkModel bookmark;
  ToggleBookmarkOff({required this.bookmark});
}

class OnShowBookmarks extends BookmarkEvent {}
