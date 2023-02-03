import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsline/news_data_source.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsDataSource newsDataSource;
  NewsCubit(this.newsDataSource) : super(NewsInitial());

  Future<void> getNews() async {
    emit(NewsLoading());
    var data = await newsDataSource.getNews();

    data = data
        .where((result) =>
            result['image_url'] != null && result['description'] != "")
        .toList();
    data.shuffle();
    emit(NewsLoaded(data));
  }
}
