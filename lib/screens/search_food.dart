import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

const String api = 'HDwwx530ZKzT5ScLVt0cv3NV1AH5aTHgcNuAGnOz';
final String mainURL = 'https://api.nal.usda.gov/ndb/search/?format=json&q=';
final search = 'https://api.nal.usda.gov/ndb/search/?format=json&q=butter&sort=n&max=25&offset=0&api_key=$api';

class SearchFoodScreen extends StatefulWidget {
  static String id = 'search_food';

  @override
  _SearchFoodScreenState createState() => _SearchFoodScreenState();
}

class _SearchFoodScreenState extends State<SearchFoodScreen> {
  List<String> searchResults = new List();
  String query = '';
  String totalResults;

  void getResults() async {
    print(mainURL + query + '&sort=n&max=25&offset=0&api_key=$api');
    var response = await http.get(mainURL + query + '&sort=n&max=25&offset=0&api_key=$api');
    if (response.statusCode == 200) {
      searchResults.clear();

      var decoded = convert.jsonDecode(response.body);
      totalResults = decoded['list']['total'].toString();
//      var totalSearchResults = decoded['list']['total'];
      var items = decoded['list']['item'];
//      print(totalSearchResults);
      //print(items);
      //print(decoded['list']['item'].length);
      for (int i = 0; i < items.length; i++) {
        print('--------------------------------------');
        print(items[i]['offset']);
        print(items[i]['group']);
        print(items[i]['name']);
        print(items[i]['ndbno']);
        print(items[i]['ds']);
        print(items[i]['manu']);
        searchResults.add(items[i]['name']);
      }
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Text('Add Food'),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(),
                        decoration: InputDecoration(
                          icon: Icon(Icons.search),
                          labelText: 'Search...',
                          helperText: 'Results ($totalResults)',
                        ),

                        onFieldSubmitted: (String value) {
                          print(value);
                          setState(() {
                            query = value;
                            getResults();
                          });
                        },
                        onSaved: (String value) {

                        },
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 20.0,),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, position) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Text(searchResults[position]),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: searchResults.length,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
