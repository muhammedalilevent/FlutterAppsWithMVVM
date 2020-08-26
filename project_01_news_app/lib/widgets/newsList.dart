import 'package:flutter/material.dart';
import 'package:project_01_news_app/Pages/news_article_details_page.dart';
import 'package:project_01_news_app/viewmodels/news_article_VM.dart';


class NewsList  extends StatelessWidget {

  final List<NewsArticleViewModel> articles;

  NewsList({this.articles});

  void _showNewsArticleDetails(BuildContext context,NewsArticleViewModel article){
    Navigator.push(context, MaterialPageRoute(
      builder: (context)=>NewsArticleDetailsPage(article: article)
    ));
  }

 @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: articles.length,
      itemBuilder:(context,index) {
        final article= articles[index];
        return ListTile(
          onTap: () {
            _showNewsArticleDetails(context,article);
          },
          title: Text(articles[index].title),
          leading: Container(
              width: 100,
              height: 100,
              child: article.imageURL == null ? Image.asset("images/placeholder.png") : Image.network(article.imageURL)),
        );
      },
    );
  }
}
