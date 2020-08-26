import 'package:flutter/material.dart';
import 'package:project_01_news_app/viewmodels/news_article_VM.dart';
import 'package:webview_flutter/webview_flutter.dart';






class NewsArticleDetailsPage extends StatelessWidget {
  final NewsArticleViewModel article;

NewsArticleDetailsPage ({this.article});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("${this.article.title}"),
      ),
      body: WebView(
        initialUrl: this.article.url,
      ),
    );
  }

}