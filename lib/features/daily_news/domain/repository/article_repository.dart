import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository{

  Future<DataState<List<ArticleEntity>>> getNewsArticles();



}