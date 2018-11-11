import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import './article.dart';


class TopTab extends StatefulWidget {
  @override
  _TopTabState createState() => new _TopTabState();
}

class _TopTabState extends State<TopTab> {
  List<dynamic> _articles = List<dynamic>();
  void _fetchArticles() async {
    var url =
        'http://beta.friendtofly.com/wp-json/wp/v2/posts';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var _body = jsonDecode(response.body);
      setState(() {
        _articles = _body;
      });
    }
  }

//  void _launchURL(String url) async {
//    if (await canLaunch(url)) {
//      await launch(url);
//    } else {
//      throw 'Could not launch $url';
//    }
//  }

  @override
  void initState() {
    super.initState();
    _fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    if (_articles.length > 0) {
      return Center(
          child: Column(children: <Widget>[
        Expanded(
            child: ListView.builder(
          itemCount: _articles.length,
          itemBuilder: (BuildContext context, int index) {
            Article _postItem;
            _postItem = Article.fromJson(_articles[index]);
            return new Card(
              elevation: 1.7,
              child: new ExpansionTile(
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 7.0, 0.0, 7.0),
                  child: new Text(
                    _postItem.title,
                    style: new TextStyle(
                      fontSize: 17.0,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(11.0, 7.0, 11.0, 7.0),
                    child: new Text(
                      _postItem.content,
                      style: new TextStyle(
                        fontSize: 13.0,
                        fontFamily: 'Ubuntu',
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),//
                ],
              ),
            );
          },
        ))
      ]));
    } else {
      return AlertDialog(
        content: LinearProgressIndicator(),
        title: Center(
          child: Text(
            "Fetching News",
            style: new TextStyle(
              fontFamily: 'Ubuntu',
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      );
    }
  }
}
