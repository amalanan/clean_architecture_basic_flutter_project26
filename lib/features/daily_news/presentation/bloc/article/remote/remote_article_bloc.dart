import 'package:clean_architecture_project/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:clean_architecture_project/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../domain/usecases/get_article_usecase.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticlesEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticlesUseCase;

  RemoteArticlesBloc(this._getArticlesUseCase)
    : super(const RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(
    GetArticles event,
    Emitter<RemoteArticleState> emit,
  ) async {
    final dataState = await _getArticlesUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(articles: dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteArticlesError(error: dataState.error!));
    }
  }
}
