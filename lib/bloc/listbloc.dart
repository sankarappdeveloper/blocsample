import 'package:blocsample/bloc/listevent.dart';
import 'package:blocsample/bloc/liststate.dart';
import 'package:blocsample/model/listresponse.dart';
import 'package:blocsample/rest/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Listbloc extends Bloc<Listevent, Liststate> {
  Api repo;

  Listbloc(this.repo) : super(DataIsNotSearched());

  @override
  // TODO: implement initialState
  Liststate get initialState => Datanotloaded();

  @override
  Stream<Liststate> mapEventToState(Listevent event) async* {
    // TODO: implement mapEventToState
    if (event is Fetchdata) {
      yield DataIsLoading();

      try {
        List<Listresponse>? listresponse = await Api().getlist();
        yield DataIsLoaded(listresponse!);
      } catch (_) {
        print(_);
        yield Datanotloaded();
      }
    } else if (event is ResetWeather) {
      yield DataIsNotSearched();
    }
  }
}
