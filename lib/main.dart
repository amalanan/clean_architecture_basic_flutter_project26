import 'package:clean_architecture_project/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:clean_architecture_project/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'configs/theme/app_themes.dart' as AppThemes;
import 'features/daily_news/presentation/pages/home/daily_news.dart';
import 'injection_container.dart';

void main() {
  initializeDependencies();
  runApp(
    DevicePreview(
      enabled: true, // خليها false لو بدك تطفئيها
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        theme: AppThemes.theme(),
        debugShowCheckedModeBanner: false,
        home: DailyNews(),
      ),
    );
  }
}
