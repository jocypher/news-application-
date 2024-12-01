import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Api/news_api.dart';
import 'package:movie_app/core/storage.dart';
import 'package:movie_app/features/widgets/article_tile.dart';
import 'package:movie_app/features/widgets/category_widget.dart';
import 'package:movie_app/infos/category_data.dart';
import 'package:movie_app/model/category_class_model.dart';
import 'package:movie_app/model/news_class_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryClassModel> categoryClassModel = List.empty(growable: true);
  List<NewsClass> news = List.empty(growable: true);
  bool _isLoading = false;

  @override
  void initState() {
    categoryClassModel = getCategoryModel();
    super.initState();
    getNews();
  }

  void getNews() async {
    setState(() {
      _isLoading = true;
    });

    final hiveService = await HiveService.getInstance();
    final cachedNews = hiveService.getValue("news");

    print("the value of the cached news is ${cachedNews.runtimeType}");
    
    if (cachedNews != null) {
      news = List<NewsClass>.from(cachedNews ?? []);
      print("the news is $news");
      Flushbar(
        title: "data is cached",
        titleColor: Colors.white,
        icon: const Icon(Icons.check),
        titleSize: 20,
        backgroundColor: Colors.green,
        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        message: "yeah i have been able to cache the data i wanted",
        flushbarPosition: FlushbarPosition.TOP,

      ).show(context);
    } else {
      NewsApi newsApi = NewsApi();
      await newsApi.getNews();
      news = newsApi.articleNews;
    }
    setState(() {
        _isLoading = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "News App",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.blueGrey,
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 70,
                      child: ListView.builder(
                          itemCount: categoryClassModel.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final cat = categoryClassModel[index];
                            return CategoryTile(
                                categoryName: cat.categoryName,
                                imageUrl: cat.imageUrl);
                          }),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: ListView.builder(
                          itemCount: news.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return BlogTile(
                              description: news[index].description!,
                              imageUrl: news[index].urlToImage!,
                              title: news[index].title!,
                              url: news[index].url!,
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
