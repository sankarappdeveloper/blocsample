import 'package:blocsample/bloc/listbloc.dart';
import 'package:blocsample/bloc/listevent.dart';
import 'package:blocsample/bloc/liststate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class Listview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Listview();
  }
}

class _Listview extends State<Listview> {
  @override
  Widget build(BuildContext context) {
    // var provider=Provider.of<Listprovider>(context,listen: true);

    final weatherBloc = BlocProvider.of<Listbloc>(context);
    // TODO: implement build
    return Scaffold(body: BlocBuilder<Listbloc, Liststate>(
      builder: (context, state) {
        if (state is Datanotloaded)
          return Center(
            child: Text("No data"),
          );
        else if (state is DataIsLoading)
          return Center(child: CircularProgressIndicator());
        else if (state is DataIsLoaded)
          return ListView.builder(
              itemCount: state.getData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.getData[index]!.fullName),
                  subtitle: Text("empty"),
                );
              });
        else {
          return Text(
            "Error",
            style: TextStyle(color: Colors.white),
          );
        }
      },
    ));
  }

  @override
  void initState() {
    BlocProvider.of<Listbloc>(context).add(Fetchdata());
  }
}
