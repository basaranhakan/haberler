import 'dart:convert';
import 'dart:html';

import 'package:haberler/models/article.dart';
import 'package:haberler/models/news.dart';
import 'package:http/http.dart' as http;

class NewsService {
  static NewsService singleton = NewsService._internal();
  NewsService._internal();

  factory NewsService() {
    return singleton;
  }

  static Future<List<Articles>?> getNews() async {
    String url =
        " http://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=0572640211454c96839506a307b5f0fe";

     final response = await http.get(url);
     if (response.body.isNotEmpty) {
       final responseJson = json.decode(response.body);
      News news = News.fromJson(responseJson);
       return news.articles;
    }
  return null;
  }
}
