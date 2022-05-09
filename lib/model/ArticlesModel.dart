class ArticlesModel
{
  var title;
  var url;
  var urlToImage;
  var description;
  var publishedAt;
  var author;

  ArticlesModel({
    required this.title,
    required this.url,
    required this.urlToImage,
    required this.description,
    required this.publishedAt,
    required this.author,
  });
}