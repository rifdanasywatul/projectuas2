import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<dynamic> news = [];

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=volunteer%20organization&apiKey=c7f416cf84994ac6beae21f776fba89c'));
    if (response.statusCode == 200) {
      List<dynamic> allNews = json.decode(response.body)['articles'];
      allNews.sort((a, b) => _getRelevance(b).compareTo(_getRelevance(a)));
      setState(() {
        news = allNews;
      });
    } else {
      throw Exception('Failed to load news');
    }
  }

  int _getRelevance(Map<String, dynamic> newsItem) {
    String title = newsItem['title']?.toLowerCase() ?? '';
    String description = newsItem['description']?.toLowerCase() ?? '';
    if (title.contains('volunteer') || description.contains('volunteer')) {
      return 1;
    } else {
      return 0;
    }
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Volunteer News',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: InkWell(
                onTap: () {
                  String url = news[index]['url'];
                  if (url.isNotEmpty) {
                    launchURL(url);
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(news[index]['urlToImage'] ?? ''),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        news[index]['title'] ?? '',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 0, 12, 8),
                      child: Text(
                        news[index]['description'] ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}