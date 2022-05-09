import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/ArticlesModel.dart';
class Api
{
  String ApiKey="79f66affb3fc4a598322e093a5eef04c";
 Future<List<ArticlesModel>> getGeneralArticles()async
  {
    List <ArticlesModel> listmodel =[];
    var url =Uri.parse("https://newsapi.org/v2/top-headlines?country=eg&apiKey=$ApiKey");
    var response = await http.get(url);
    var repsonebody = jsonDecode(response.body)["articles"];

    for(var i in repsonebody)
      {
          listmodel.add(ArticlesModel(
              title: i["title"],
              url: i["url"],
              urlToImage: i["urlToImage"],
              description: i["description"],
              publishedAt: i["publishedAt"],
              author: i["author"]));
      }

    return listmodel;
  }

  Future<List<ArticlesModel>> getCategoryArticles(String category)async
  {
    List <ArticlesModel> listmodel =[];
    var url =Uri.parse("https://newsapi.org/v2/top-headlines?country=eg&$category=business&apiKey=$ApiKey");
    var response = await http.get(url);
    var repsonebody = jsonDecode(response.body)["articles"];

    for(var i in repsonebody)
    {
      listmodel.add(ArticlesModel(
          title: i["title"],
          url: i["url"],
          urlToImage: i["urlToImage"],
          description: i["description"],
          publishedAt: i["publishedAt"],
          author: i["author"]));
    }

    return listmodel;
  }
}