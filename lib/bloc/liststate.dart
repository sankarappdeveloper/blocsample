import 'package:blocsample/model/listresponse.dart';
import 'package:equatable/equatable.dart';

class Liststate extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class DataIsNotSearched extends Liststate {}

class DataIsLoading extends Liststate {}

class DataIsLoaded extends Liststate {
  final List<Listresponse> data;

  DataIsLoaded(this.data);

  List<Listresponse> get getData => data;

  @override
  // TODO: implement props
  List<Object> get props => [data];
}

class Datanotloaded extends Liststate {}
