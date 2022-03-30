import '../../model/learn_feed_model.dart';

/// Defines the base class for the feed states.
abstract class FeedState {
  const FeedState(this.content);

  /// A single feed.
  final List<LearnContent>? content;
}

/// Defines the initial feed state.
class InitialFeedState extends FeedState {
  InitialFeedState({List<LearnContent>? content}) : super(content);
}

/// Defines the feed loading state
class FeedLoading extends FeedState {
  FeedLoading({List<LearnContent>? content}) : super(content);
}

/// Defines the loaded feed state.
class FeedLoaded extends FeedState {
  const FeedLoaded(List<LearnContent>? content) : super(content);
}

/// Defines the error feed state.
class FeedError extends FeedState {
  FeedError({List<LearnContent>? content}) : super(content);
}
