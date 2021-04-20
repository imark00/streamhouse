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

  static List actionMovies;
  static Future<List> getActionMovies() async {
    try {
      http.Response response = await http.get(
          'https://$kURL/discover/movie?api_key=$kApiKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_genres=28');

      if (response.statusCode == 200) {
        Map mapResponse = jsonDecode(response.body);
        return actionMovies = mapResponse['results'];
      } else {
        print(response.statusCode);
        throw ('Failed');
      }
    } catch (e) {
      throw (e);
    }
  }

  static List scienceFiction;
  static Future<List> getScienceFictionMovies() async {
    try {
      http.Response response = await http.get(
          'https://$kURL/discover/movie?api_key=$kApiKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_genres=878');

      if (response.statusCode == 200) {
        Map mapResponse = jsonDecode(response.body);
        return scienceFiction = mapResponse['results'];
      } else {
        print(response.statusCode);
        throw ('Failed');
      }
    } catch (e) {
      throw (e);
    }
  }

  static List horrorMovies;
  static Future<List> getHorrorMovies() async {
    try {
      http.Response response = await http.get(
          'https://$kURL/discover/movie?api_key=$kApiKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_genres=27');

      if (response.statusCode == 200) {
        Map mapResponse = jsonDecode(response.body);
        return horrorMovies = mapResponse['results'];
      } else {
        print(response.statusCode);
        throw ('Failed');
      }
    } catch (e) {
      throw (e);
    }
  }

  static List comedyMovies;
  static Future<List> getComedyMovies() async {
    try {
      http.Response response = await http.get(
          'https://$kURL/discover/movie?api_key=$kApiKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_genres=35');

      if (response.statusCode == 200) {
        Map mapResponse = jsonDecode(response.body);
        return comedyMovies = mapResponse['results'];
      } else {
        print(response.statusCode);
        throw ('Failed');
      }
    } catch (e) {
      throw (e);
    }
  }
}

class TVShows {
  static List topRatedTVShows;
  static Future<List> getTopRatedTVShows() async {
    try {
      http.Response response = await http.get(
          'https://$kURL/tv/top_rated?api_key=$kApiKey&language=en-US&page=1');

      if (response.statusCode == 200) {
        Map mapResponse = jsonDecode(response.body);
        return topRatedTVShows = mapResponse['results'];
      } else {
        print(response.statusCode);
        throw ('Failed');
      }
    } catch (e) {
      throw (e);
    }
  }

  static List airingTodayTVShows;
  static Future<List> getAiringTodayTVShows() async {
    try {
      http.Response response = await http.get(
          'https://$kURL/tv/airing_today?api_key=$kApiKey&language=en-US&page=1');

      if (response.statusCode == 200) {
        Map mapResponse = jsonDecode(response.body);
        return airingTodayTVShows = mapResponse['results'];
      } else {
        print(response.statusCode);
        throw ('Failed');
      }
    } catch (e) {
      throw (e);
    }
  }

  static List onTheAirTVShows;
  static Future<List> getOnTheAirTVShows() async {
    try {
      http.Response response = await http.get(
          'https://$kURL/tv/on_the_air?api_key=$kApiKey&language=en-US&page=1');

      if (response.statusCode == 200) {
        Map mapResponse = jsonDecode(response.body);
        return onTheAirTVShows = mapResponse['results'];
      } else {
        print(response.statusCode);
        throw ('Failed');
      }
    } catch (e) {
      throw (e);
    }
  }

  static List dramaTVShows;
  static Future<List> getDramaTVShows() async {
    try {
      http.Response response = await http.get(
          'https://$kURL/discover/tv?api_key=$kApiKey&language=en-US&sort_by=popularity.desc&page=1&with_genres=18&include_null_first_air_dates=false');

      if (response.statusCode == 200) {
        Map mapResponse = jsonDecode(response.body);
        return dramaTVShows = mapResponse['results'];
      } else {
        print(response.statusCode);
        throw ('Failed');
      }
    } catch (e) {
      throw (e);
    }
  }

  static List romanceTVShows;
  static Future<List> getRomanceTVShows() async {
    try {
      http.Response response = await http.get(
          'https://$kURL/discover/tv?api_key=$kApiKey&language=en-US&sort_by=popularity.desc&page=1&with_genres=878&include_null_first_air_dates=false');

      if (response.statusCode == 200) {
        Map mapResponse = jsonDecode(response.body);
        return romanceTVShows = mapResponse['results'];
      } else {
        print(response.statusCode);
        throw ('Failed');
      }
    } catch (e) {
      throw (e);
    }
  }

  static List scienceFictionTVShows;
  static Future<List> getScienceFictionTVShows() async {
    try {
      http.Response response = await http.get(
          'https://$kURL/discover/tv?api_key=$kApiKey&language=en-US&sort_by=popularity.desc&page=1&with_genres=878&include_null_first_air_dates=false');

      if (response.statusCode == 200) {
        Map mapResponse = jsonDecode(response.body);
        return scienceFictionTVShows = mapResponse['results'];
      } else {
        print(response.statusCode);
        throw ('Failed');
      }
    } catch (e) {
      throw (e);
    }
  }

  static List comedyTVShows;
  static Future<List> getComedyTVShows() async {
    try {
      http.Response response = await http.get(
          'https://$kURL/discover/tv?api_key=$kApiKey&language=en-US&sort_by=popularity.desc&page=1&with_genres=35&include_null_first_air_dates=false');

      if (response.statusCode == 200) {
        Map mapResponse = jsonDecode(response.body);
        return comedyTVShows = mapResponse['results'];
      } else {
        print(response.statusCode);
        throw ('Failed');
      }
    } catch (e) {
      throw (e);
    }
  }

  static List animationTVShows;
  static Future<List> getAnimationTVShows() async {
    try {
      http.Response response = await http.get(
          'https://$kURL/discover/tv?api_key=$kApiKey&language=en-US&sort_by=popularity.desc&page=1&with_genres=16&include_null_first_air_dates=false');

      if (response.statusCode == 200) {
        Map mapResponse = jsonDecode(response.body);
        return animationTVShows = mapResponse['results'];
      } else {
        print(response.statusCode);
        throw ('Failed');
      }
    } catch (e) {
      throw (e);
    }
  }
}
