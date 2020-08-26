import 'package:flutter/material.dart';
import 'package:project_01_news_app/Pages/news_list_page.dart';
import 'package:project_01_news_app/viewmodels/news_article_list_VM.dart';
import 'package:provider/provider.dart';



void main()=> runApp(App());


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fresh News",
     home: ChangeNotifierProvider(
       create: (context)=>NewsArticleListViewModel(),
       child: NewsListPage(),
     )
    );
  }
}