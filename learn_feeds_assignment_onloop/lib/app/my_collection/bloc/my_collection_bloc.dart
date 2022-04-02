import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/my_collection_model.dart';
import 'my_collection_event.dart';
import 'my_collection_state.dart';

class MyCollectionBloc extends Bloc<MyCollectionEvent, MyCollectionState> {
  final List<MyCollectionModel> myCollections = [];

  MyCollectionBloc() : super(InitialMyCollectionState()) {
    on(_onShowMyCollection);
    on(_onToggleMyCollectionOn);
    on(_onToggleMyCollectionOff);
  }

  void _onShowMyCollection(event, emit) {
    emit(MyCollectionLoaded(myCollections));
  }

  void _onToggleMyCollectionOn(ToggleMyCollectionOn event, emit) {
    myCollections.add(event.myCollectionModel);
  }

  void _onToggleMyCollectionOff(ToggleMyCollectionOff event, emit) {
    for (final myCollection in myCollections) {
      if (myCollection.content.title == event.myCollectionModel.content.title) {
        myCollections.removeWhere(
          (e) => e.content.title == event.myCollectionModel.content.title,
        );
      }
    }
  }
}
