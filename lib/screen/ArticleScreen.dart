import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../model/Article.dart';

import '../widget/CardInfo.dart';
import '../widget/CardSignifications.dart';
import '../widget/CardAdages.dart';
import '../widget/CardConjugates.dart';

class _ArticleScreenState extends State<ArticleScreen> {
  List<Article> articles = [];
  bool articlesLoading = false;
  String articlesLoadingErrorMessage = '';

  Future setArticles() async {
    setState(() {
      articlesLoading = true;
      articlesLoadingErrorMessage = '';
    });

    Timer(Duration(milliseconds: 0), () async {
      try {
        http.Response response = await http.get(Uri.parse('https://sozluk.gov.tr/gts?ara=${widget.article}'));

        if (response.statusCode == 200) {
          final List<dynamic> responseJson = jsonDecode(utf8.decode(response.bodyBytes));

          setState(() {
            articles = List<Article>.from(responseJson.map((model) => Article.fromJson(model)));
          });
        } else {
          setState(() {
            articlesLoadingErrorMessage = 'Söz yüklenirken beklenmeyen bir hata oluştu';
          });
        }

        setState(() {
          articlesLoading = false;
        });
      } catch (err) {
        setState(() {
          articlesLoading = true;
          articlesLoadingErrorMessage = err.toString();
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();

    setArticles();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,

        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,

          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.light,
        ),

        centerTitle: true,
        title: GestureDetector(
          child: Text(widget.article),
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text(widget.article, style: TextStyle(fontSize: 16)),
              ),
              barrierDismissible: true,
            );
          },
        ),
      ),

      body: Builder(
        builder: (BuildContext context) {
          // loading
          if (articlesLoading) {
            return Container(alignment: Alignment.center, child: CircularProgressIndicator());
          }

          // error
          if (!articlesLoading && articlesLoadingErrorMessage != '') {
            return Container(alignment: Alignment.center, child: Text(articlesLoadingErrorMessage));
          }

          // ignore: unused_local_variable
          final Article article = articles[0];

          return ListView(
            children: [
              SizedBox(height: 16),

              if (article.lisan != null || article.telaffuz != null)
                CardInfo(lisan: article.lisan, telaffuz: article.telaffuz),

              if (article.anlamlarListe.length > 0)
                CardSignifications(anlamlarListe: article.anlamlarListe),

              if (article.atasozu.length > 0)
                CardAdages(adages: article.atasozu),

              if (article.birlesikler != null)
                CardConjugates(articles: article.birlesikler!.split(', ')),

            ],
          );

        }
      ),
    );
  }
}

class ArticleScreen extends StatefulWidget {
  ArticleScreen({
    Key? key,
    required this.article,
  }) : super(key: key);

  final String article;

  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}
