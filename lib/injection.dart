import 'package:get_it/get_it.dart';
import 'package:newsline/cubit/news_cubit.dart';

import 'news_data_source.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => NewsCubit(sl()));
  sl.registerLazySingleton(() => NewsDataSource());
}
