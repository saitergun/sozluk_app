import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils.dart';

import 'ArticleScreen.dart';

class _HomeScreenState extends State<HomeScreen> {
  List<String> autocomplete = [];
  bool autocompleteLoading = false;
  String autocompleteLoadingErrorMessage = '';

  String query = '';
  bool searching = false;
  List<String> searchResult = [];

  bool focusedSearchInput = false;
  late FocusNode searchInputFocusNode;
  Timer searchInputDebounce = new Timer(Duration(), () {});

  final searchInputController = TextEditingController();

  Future setAutocomplete() async {
    setState(() {
      autocompleteLoading = true;
      autocompleteLoadingErrorMessage = '';
    });

    Timer(Duration(milliseconds: 0), () async {
      try {
        String stringData = await rootBundle.loadString('assets/data/autocomplete2.json');

        List data = await jsonDecode(stringData);

        List<String> items = [];

        for (dynamic article in data) {
          items.add(article);
        }

        setState(() {
          autocomplete = items;
          autocompleteLoading = false;
        });
      } catch (err) {
        setState(() {
          autocompleteLoading = true;
          autocompleteLoadingErrorMessage = err.toString();
        });
      }
    });
  }

  void onChangeSearchInput(String value) {
    final String value2 = value.trim();

    setState(() {
      searching = true;
    });

    if (searchInputDebounce.isActive || value2 == '') {
      searchInputDebounce.cancel();
    }

    if (value2 == '' || value2.contains(RegExp(r'([qwx0-9])+'))) {
      setState(() {
        query = value2;
        searchResult = [];
        searching = false;
      });
    } else {
      searchInputDebounce = Timer(Duration(milliseconds: 500), () {
        try {
          List<String> result = autocomplete
            .where((String article) => article.length >= value2.length && regexLocalizer(value2).hasMatch(article))
            .toList()
          ;

          result.sort((String a, String b) {
            final String aText = latinizer(a.toLowerCase());
            final String bText = latinizer(b.toLowerCase());

            double aScore = 0;
            double bScore = 0;

            if (value2.toLowerCase().length != aText.length) {
              if (aText.indexOf(regexLocalizer(value2)) == 0) {
                aScore = 1 + aText.substring(value2.length).length / 10;
              } else {
                aScore = 3 + aText.replaceAll(value2, '').length / 10;
              }
            }

            if (value2.toLowerCase().length != bText.length) {
              if (bText.indexOf(regexLocalizer(value2)) == 0) {
                bScore = 1 + bText.substring(value2.length).length / 10;
              } else {
                bScore = 3 + bText.replaceAll(value2, '').length / 10;
              }
            }

            return aScore.compareTo(bScore);
          });

          setState(() {
            searchResult = result.take(20).toList();
          });
        } catch (err) {
          print('err => ${err.toString()}');
        } finally {
          setState(() {
            searching = false;
            query = value2;
          });
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();

    setAutocomplete();

    searchInputFocusNode = FocusNode();
  }

  @override
  void dispose() {
    searchInputDebounce.cancel();
    searchInputFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        titleSpacing: 0,

        automaticallyImplyLeading: false,
        backwardsCompatibility: false,

        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,

          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.light,
        ),

        backgroundColor: Colors.white,

        actions: [
          if (query != '')
            IconButton(
              icon: Icon(Icons.close_rounded, color: Colors.black54),
              onPressed: () {
                searchInputController.text = '';

                setState(() {
                  query = '';
                });
              },
            ),
        ],

        title: TextFormField(

          style: TextStyle(
            fontSize: 16 / MediaQuery.of(context).textScaleFactor,
          ),

          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 0),

            hintText: 'Aramaya başla',

            filled: true,
            fillColor: Colors.transparent,
            hoverColor: Colors.transparent,

            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 0),
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),

            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 0),
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
          ),

          enabled: !autocompleteLoading && autocompleteLoadingErrorMessage == '',

          controller: searchInputController,
          focusNode: searchInputFocusNode,

          onChanged: onChangeSearchInput,

          onTap: () {
            setState(() {
              focusedSearchInput = true;
            });
          },
        ),

        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2),

          child: Container(
            alignment: Alignment.center,
            color: Colors.transparent,
            height: 2,
            child: searching ? LinearProgressIndicator(
              backgroundColor: Theme.of(context).primaryColorLight,
              color: Theme.of(context).primaryColor,
            ) : null,
          ),
        ),
      ),

      body: Builder(
        builder: (context) {
          // loading
          if (autocompleteLoading) {
            return Container(alignment: Alignment.center, child: CircularProgressIndicator());
          }

          // error
          if (!autocompleteLoading && autocompleteLoadingErrorMessage != '') {
            return Container(alignment: Alignment.center, child: Text(autocompleteLoadingErrorMessage));
          }

          // ready
          if (!autocompleteLoading && autocompleteLoadingErrorMessage == '' && query == '') {
            return Container(
              width: double.infinity,
              height: double.infinity,

              padding: EdgeInsets.symmetric(vertical: 32),

              child: Column(
                children: [
                  Icon(Icons.search_rounded, size: 48, color: Colors.black26),

                  SizedBox(height: 8),

                  Text(
                    searching ? 'aranıyor...' : '${autocomplete.length} söz yüklendi',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16 / MediaQuery.of(context).textScaleFactor,
                    ),
                  ),
                ],
              ),
            );
          }

          // no result
          if (!autocompleteLoading && autocompleteLoadingErrorMessage == '' && query != '' && searchResult.length == 0) {
            return Container(
              alignment: Alignment.topCenter,
              color: Colors.white,
              child: ListTile(
                title: Text('"$query" ile eşleşen bir söz bulamadık'),
              ),
            );
          }

          return ListView.builder(
            itemCount: searchResult.length,
            itemBuilder: (BuildContext context, int index) {
              final article = searchResult[index];
              final bool exact = article.toLowerCase() == query.toLowerCase();

              return InkWell(
                child: ListTile(
                  dense: true,

                  leading: Icon(exact ? Icons.bolt_rounded : Icons.search_rounded),
                  minLeadingWidth: 0,

                  hoverColor: Colors.transparent,

                  title: RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style.copyWith(
                        fontSize: 16,
                      ),
                      children: createHighlightedTextSpanChildren(article, query),
                    ),
                  ),

                  onTap: () {
                    searchInputFocusNode.unfocus();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArticleScreen(article: article),
                      ),
                    );
                  },
                ),
              );
            },
          );
        }
      ),

    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
