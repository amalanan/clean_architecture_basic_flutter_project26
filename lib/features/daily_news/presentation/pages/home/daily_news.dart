import 'package:clean_architecture_project/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:clean_architecture_project/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/article_tile.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppbar(), body: _buildBody());
  }

  _buildAppbar() {
    return AppBar(
      title: Text('Daily News', style: TextStyle(color: Colors.black)),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticlesBloc, RemoteArticleState>(
      builder: (_, state) {
        if (state is RemoteArticlesLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is RemoteArticlesError) {
          return Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteArticlesDone) {
          print(state.articles);

          return ListView.builder(
            itemBuilder: (context, index) {
              return ArticleTile(
                article: state.articles![index],
              );
            },
            itemCount: state.articles!.length,
          );
        }

        return const SizedBox();
      },
    );
  }
}
