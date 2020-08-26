import 'package:flutter/material.dart';
import 'package:project_01_news_app/viewmodels/news_article_list_VM.dart';
import 'package:project_01_news_app/widgets/newsList.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatelessWidget {
  final _controller = TextEditingController();

  Widget _buildList(NewsArticleListViewModel vm){
    switch(vm.loadingStatus){
      case LoadingStatus.searching:
        return Align(child: CircularProgressIndicator(),);
      case LoadingStatus.empty:
        return Align(child: Text("No Results Found!"),);
      case LoadingStatus.completed:
        return Expanded(child: NewsList(articles: vm.articles),);
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Top News"),
        ),
        body: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  vm.search(value);
                }
              },
              decoration: InputDecoration(
                  labelText: "Enter Search Term",
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.search),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _controller.clear();
                    },
                  )),
            ),
           _buildList(vm)
          ],
        ));
  }
}
