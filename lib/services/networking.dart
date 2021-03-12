import 'dart:convert';
import 'package:stream_house/api.dart';
import 'package:http/http.dart' as http;

const kURL = 'api.themoviedb.org/3';

class TrendingMovies {
  static List trendingMovies;
  static Future getTrendingMovies() async {
    try {
      http.Response response =
          await http.get('https://$kURL/trending/movie/day?api_key=$kApiKey');

      if (response.statusCode == 200) {
        Map mapResponse = jsonDecode(response.body);
        return trendingMovies = mapResponse['results'];
      } else {
        print(response.statusCode);
        throw ('Failed');
      }
    } catch (e) {
      print(e);
      return e;
    }
  }
}

class TrendingTVShows {
  static List trendingTVShows;
  static Future getTrendingTVShows() async {
    try {
      http.Response response =
          await http.get('https://$kURL/trending/tv/day?api_key=$kApiKey');

      if (response.statusCode == 200) {
        Map mapResponse = jsonDecode(response.body);
        return trendingTVShows = mapResponse['results'];
      } else {
        print(response.statusCode);
        throw ('Failed');
      }
    } catch (e) {
      print(e);
      return e;
    }
  }
}

class Movies {
  static List upcomingMovies;
  static Future<List> getUpcomingMovies() async {
    try {
      http.Response response = await http.get(
          'https://$kURL/movie/upcoming?api_key=$kApiKey&language=en-US&page=1');

      if (response.statusCode == 200) {
        Map mapResponse = jsonDecode(response.body);
        return upcomingMovies = mapResponse['results'];
      } else {
        print(response.statusCode);
        throw ('Failed');
      }
    } catch (e) {
      print(e);
      return (e);
    }
  }

  static List topRatedMovies;
  static Future<List> getTopRatedMovies() async {
    try {
      http.Response response = await http.get(
          'https://$kURL/movie/top_rated?api_key=$kApiKey&language=en-US&page=1');

      if (response.statusCode == 200) {
        Map mapResponse = jsonDecode((response.body));
        topRatedMovies = mapResponse['results'];
        return topRatedMovies;
      } else {
        print(response.statusCode);
        throw ('Failed');
      }
    } catch (e) {
      print(e);
      return (e);
    }
  }
}
