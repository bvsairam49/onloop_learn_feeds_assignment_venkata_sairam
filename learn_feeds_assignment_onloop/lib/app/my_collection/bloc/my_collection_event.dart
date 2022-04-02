import '../model/my_collection_model.dart';

abstract class MyCollectionEvent {}

class ToggleMyCollectionOn extends MyCollectionEvent {
  final MyCollectionModel myCollectionModel;
  ToggleMyCollectionOn({required this.myCollectionModel});
}

class ToggleMyCollectionOff extends MyCollectionEvent {
  final MyCollectionModel myCollectionModel;
  ToggleMyCollectionOff({required this.myCollectionModel});
}

class OnShowMyCollections extends MyCollectionEvent {}
