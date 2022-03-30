import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../services/api_service.dart';
import '../../model/learn_feed_model.dart';
import 'feed_event.dart';
import 'feed_state.dart';

/// Defines the feed bloc.
class FeedBloc extends Bloc<FeedEvent, FeedState> {
  List<LearnContent> content = const [];

  FeedBloc({required this.service}) : super(InitialFeedState()) {
    on(_onFeedRequested);
    on(_onFilterRequested);
  }

  /// The feed api service.
  final ApiService service;

  Future<void> _onFeedRequested(FeedRequested event, Emitter emit) async {
    try {
      if (event is FeedRequested) {
        emit(FeedLoading());
        final feeds = await service.fetchLearnContentFeeds();

        if (feeds != null) {
          content = feeds.learnContent;
          emit(FeedLoaded(content));
        }
      }
    } catch (error) {
      emit(FeedError());
    }
  }

  void _onFilterRequested(FilterFeed event, Emitter emit) {
    final List<LearnContent> filteredContent = [];

    for (final c in content) {
      for (final tag in c.tags) {
        if (tag.name == event.filterText) {
          filteredContent.add(c);
        }
      }
    }

    emit(FeedLoaded(filteredContent));
  }
}
