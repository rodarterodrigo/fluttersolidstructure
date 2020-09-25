import 'package:bloc/bloc.dart';
import 'package:flutterarquitetureapp/modules/search/domain/usercases/search_by_text.dart';
import 'package:flutterarquitetureapp/modules/search/presenter/search/states/state.dart';

class SearchBloc extends Bloc<String, SearchState>{
  final SearchByText usecase;
    SearchBloc(this.usecase): super(SearchStart());

  @override
  Stream<SearchState> mapEventToState(String searchText) async*{
    yield SearchLoad();
    final result = await usecase(searchText);
    yield result.fold((l) => SearchError(l), (r) => SearchSuccess(r));
  }
}