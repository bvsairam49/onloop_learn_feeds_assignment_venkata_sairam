abstract class FeedEvent {}

/// When the user requests the feeds.
class FeedRequested extends FeedEvent {}

class FilterFeed extends FeedEvent {
  FilterFeed({required this.filterText});

  final String filterText;
}
