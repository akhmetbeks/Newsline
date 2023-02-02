part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<dynamic> articles;

  NewsLoaded(this.articles);
}

class NewsError extends NewsState {}
