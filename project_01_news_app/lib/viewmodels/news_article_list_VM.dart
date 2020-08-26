
import 'package:flutter/cupertino.dart';
import 'package:project_01_news_app/models/news_article.dart';
import 'package:project_01_news_app/services/web_service.dart';
import 'package:project_01_news_app/viewmodels/news_article_VM.dart';


enum LoadingStatus {
  completed,
  searching,
  empty
}


class NewsArticleListViewModel extends ChangeNotifier{

  var loadingStatus =LoadingStatus.searching;

  List<NewsArticleViewModel> articles =List<NewsArticleViewModel>();

NewsArticleListViewModel(){
  _populateTopHeadLines();
}


   void search(String keyword) async{
     this.loadingStatus =LoadingStatus.searching;
     notifyListeners();
  List<NewsArticle> newsArticles = await WebService().fetchHeadlinesByKeyword(keyword);
  this.articles=newsArticles.map((article) => NewsArticleViewModel(article: article)).toList();
  this.loadingStatus=this.articles.isEmpty ? LoadingStatus.empty :
  LoadingStatus.completed;
  notifyListeners();

}

   void _populateTopHeadLines() async {
  this.loadingStatus =LoadingStatus.searching;
    notifyListeners();
   List<NewsArticle> newsArticles = await  WebService().fetchLatestTopLines();
  this.articles = newsArticles.map((article) => NewsArticleViewModel(article: article )).toList();
  this.loadingStatus=this.articles.isEmpty ? LoadingStatus.empty :
      LoadingStatus.completed;
  notifyListeners();
  }


}