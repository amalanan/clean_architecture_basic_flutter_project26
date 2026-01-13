import 'package:clean_architecture_project/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:clean_architecture_project/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_architecture_project/features/daily_news/domain/repository/article_repository.dart';
import 'package:clean_architecture_project/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/daily_news/data/repository/article_repository_implementation.dart';
import 'features/daily_news/domain/usecases/get_article_usecase.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
sl.registerSingleton<AppDatabase>(database);
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));
}
