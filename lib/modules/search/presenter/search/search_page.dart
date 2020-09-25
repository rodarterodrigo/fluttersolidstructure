import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterarquitetureapp/modules/search/presenter/search/search_bloc.dart';
import 'package:flutterarquitetureapp/modules/search/presenter/search/states/state.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final bloc = Modular.get<SearchBloc>();

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GitHub Search"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child:
            TextField(
              onChanged: bloc.add,
              decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Search"
              ),
            ),
          ),
          Expanded(
            child:
              StreamBuilder(
                stream: bloc,
                builder: (context, snapshot) {
                  final state = bloc.state;
                  if(state is SearchStart) return Center(
                    child: Text("Digite um texto."),
                  );
                  if(state is SearchError) return Center(
                    child: Text("Houve um erro na busca."),
                  );
                  if(state is SearchLoad) return Center(
                    child: CircularProgressIndicator(),
                  );
                  final list = (state as SearchSuccess).list;
                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (_, index) {
                      final item = list[index];
                      return ListTile(
                        leading: item.img == null? Container(
                          child: Text("Teste"),
                        ): CircleAvatar(
                          backgroundImage: NetworkImage(item.img),
                        ),
                        title: Text(item.title?? ""),
                      );
                    }
                  );
                },
              ),
          ),
        ],
      ),
    );
  }
}
