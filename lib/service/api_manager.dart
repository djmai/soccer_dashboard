//before let's add the http package
import 'dart:convert';

import 'package:http/http.dart';
// import 'package:http/http.dart' as http;
import 'package:soccer_demo/models/soccermodel.dart';

import 'package:flutter/services.dart' show rootBundle;

class SoccerApi {
  //now let's set our variables
  //first : let's add the endpoint URL
  // we will get all the data from api-sport.io
  // we will just change our endpoint
  //the null means that the match didn't started yet
  //let's fix that
  final String apiUrl =
      // "https://v3.football.api-sports.io/fixtures?season=2020&league=39";
      "https://v3.football.api-sports.io/fixtures?season=2022&league=262";
  //In our tutorial we will only see how to get the live matches
  //make sure to read the api documentation to be ables too understand it

  // you will find your api key in your dashboard
  //so create your account it's free
  //Now let's add the headers
  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    //Always make sure to check the api key and the limit of a request in a free api
    'x-rapidapi-key': "a38220cf8124d3834a88cb985b212a60"
  };

  //Now we will create our method
  //but before this we need to create our model

  //Now we finished with our Model
  Future<List<SoccerMatch>?> getAllMatches() async {
    try {
      // Cargar data remota API
      // Response res = await get(apiUrl, headers: headers);
      // var body;

      // if (res.statusCode == 200) {
      //   // this mean that we are connected to the data base
      //   body = jsonDecode(res.body);
      //   List<dynamic> matchesList = body['response'];
      //   print("Api service: ${body}"); // to debug
      //   List<SoccerMatch> matches = matchesList
      //       .map((dynamic item) => SoccerMatch.fromJson(item))
      //       .toList();

      //   return matches;
      // }

      // Cargar data local
      // var body;
      final resp = await rootBundle.loadString('data/matches.json');
      Map body = json.decode(resp);
      // body = jsonDecode(res.body);
      List<dynamic> matchesList = body['response'];
      // print("Api service: ${body}"); // to debug
      List<SoccerMatch> matches = matchesList
          .map((dynamic item) => SoccerMatch.fromJson(item))
          .toList();

      return matches;
    } catch (Exc) {
      print(Exc);
      rethrow;
    }
  }
}
