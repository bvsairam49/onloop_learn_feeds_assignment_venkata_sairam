import '../model/my_collection_model.dart';

abstract class MyCollectionState {
  List<MyCollectionModel> myCollections;
  MyCollectionState({this.myCollections = const []});
}

class InitialMyCollectionState extends MyCollectionState {}

class MyCollectionLoading extends MyCollectionState {}

class MyCollectionLoaded extends MyCollectionState {
  MyCollectionLoaded(List<MyCollectionModel> content)
      : super(myCollections: content);
}
