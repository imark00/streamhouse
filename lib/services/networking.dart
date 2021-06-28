import 'dart:convert';
import 'package:stream_house/api.dart';
import 'package:http/http.dart' as http;

const kURL = 'api.themoviedb.org/3';

class TrendingMovies {
  static List trendingMovies;
  static Future getTrendingMovies() async {
    try {
      http.Response response = await http.get(
          Uri.parse('https://$kURL/trending/movie/day?api_key=$kMovieApiKey'));

      if (response.statusCode == 200) {
        Map mapResponse = jsonDecode(response.body);
        print(mapResponse);
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
      http.Response response = await http.get(
          Uri.parse('https://$kURL/trending/tv/day?api_key=$kMovieApiKey'));

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
      http.Response response = await http.get(Uri.parse(
          'https://$kURL/movie/upcoming?api_key=$kMovieApiKey&language=en-US&page=1'));

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
      http.Response response = await http.get(Uri.parse(
          'https://$kURL/movie/popular?api_key=$kMovieApiKey&language=en-US&page=1'));

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
      http.Response response = await http.get(Uri.parse(
          'https://$kURL/discover/movie?api_key=$kMovieApiKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_genres=28'));

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
      http.Response response = await http.get(Uri.parse(
          'https://$kURL/discover/movie?api_key=$kMovieApiKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_genres=878'));

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
      http.Response response = await http.get(Uri.parse(
          'https://$kURL/discover/movie?api_key=$kMovieApiKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_genres=27'));

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
      http.Response response = await http.get(Uri.parse(
          'https://$kURL/discover/movie?api_key=$kMovieApiKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_genres=35'));

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
      http.Response response = await http.get(Uri.parse(
          'https://$kURL/tv/popular?api_key=$kMovieApiKey&language=en-US&page=1'));

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
      http.Response response = await http.get(Uri.parse(
          'https://$kURL/tv/airing_today?api_key=$kMovieApiKey&language=en-US&page=1'));

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
      http.Response response = await http.get(Uri.parse(
          'https://$kURL/tv/on_the_air?api_key=$kMovieApiKey&language=en-US&page=1'));

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
      http.Response response = await http.get(Uri.parse(
          'https://$kURL/discover/tv?api_key=$kMovieApiKey&language=en-US&sort_by=popularity.desc&page=1&with_genres=18&include_null_first_air_dates=false'));

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

  static List mysteryTVShows;
  static Future<List> getMysteryTVShows() async {
    try {
      http.Response response = await http.get(Uri.parse(
          'https://$kURL/discover/tv?api_key=$kMovieApiKey&language=en-US&sort_by=popularity.desc&page=1&with_genres=9648&include_null_first_air_dates=false'));

      if (response.statusCode == 200) {
        Map mapResponse = jsonDecode(response.body);
        return mysteryTVShows = mapResponse['results'];
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
      http.Response response = await http.get(Uri.parse(
          'https://$kURL/discover/tv?api_key=$kMovieApiKey&language=en-US&sort_by=popularity.desc&page=1&with_genres=878&include_null_first_air_dates=false'));

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
      http.Response response = await http.get(Uri.parse(
          'https://$kURL/discover/tv?api_key=$kMovieApiKey&language=en-US&sort_by=popularity.desc&page=1&with_genres=35&include_null_first_air_dates=false'));

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
      http.Response response = await http.get(Uri.parse(
          'https://$kURL/discover/tv?api_key=$kMovieApiKey&language=en-US&sort_by=popularity.desc&page=1&with_genres=16&include_null_first_air_dates=false'));

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

// class Movie {
//   static Map movieDetails;
//   static String movieVideoKey;
//   static Future getMovieDetails(String movieId) async {
//     try {
//       http.Response response = await http.get(Uri.parse(
//           'https://$kURL/movie/$movieId?api_key=$kMovieApiKey&language=en-US&append_to_response=videos'));
//
//       if (response.statusCode == 200) {
//         movieDetails = jsonDecode(response.body);
//
//         for (var i = 0; i < movieDetails['videos']['results'].length; i++) {
//           if (movieDetails['videos']['results'][i]['name'] ==
//                   "Official Trailer" ||
//               movieDetails['videos']['results'][i]['type'] == "Trailer") {
//             return movieVideoKey = movieDetails['videos']['results'][i]['key'];
//           }
//         }
//
//         return movieDetails;
//       } else {
//         print(response.statusCode);
//         throw ('Failed');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   static String movieVideoURL() {
//     return 'https://www.youtube.com/watch?v=$movieVideoKey';
//   }
//
//   static List movieCast;
//   static Future getMovieCast(String movieId) async {
//     try {
//       http.Response response = await http.get(Uri.parse(
//           'https://$kURL/movie/$movieId/credits?api_key=$kMovieApiKey&language=en-US'));
//
//       if (response.statusCode == 200) {
//         Map mapResponse = jsonDecode(response.body);
//         return movieCast = mapResponse['cast'];
//       } else {
//         print(response.statusCode);
//         throw ('Failed');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   static List recommendedMovies;
//   static Future getRecommendedMovies(String movieId) async {
//     try {
//       http.Response response = await http.get(Uri.parse(
//           'https://$kURL/movie/$movieId/recommendations?api_key=$kMovieApiKey&language=en-US&page=1'));
//
//       if (response.statusCode == 200) {
//         Map mapResponse = jsonDecode(response.body);
//         return recommendedMovies = mapResponse['results'];
//       } else {
//         print(response.statusCode);
//         throw ('Failed');
//       }
//     } catch (e) {}
//   }
// }

class Movie {
  static Map movieDetails;
  static String movieVideoKey;

  static Future getMovieDetails(String movieID) async {
    try {
      http.Response response = await http.get(Uri.parse(
          'https://$kURL/movie/$movieID?api_key=$kMovieApiKey&language=en-US&append_to_response=videos,credits,recommendations'));

      if (response.statusCode == 200) {
        Map mapResponse = jsonDecode(response.body);

        movieDetails = mapResponse;

        for (var i = 0; i < movieDetails['videos']['results'].length; i++) {
          if (movieDetails['videos']['results'][i]['name'] ==
                  "Official Trailer" ||
              movieDetails['videos']['results'][i]['type'] == "Trailer") {
            return movieVideoKey = movieDetails['videos']['results'][i]['key'];
          }
        }

        return movieDetails;
      } else {
        print(response.statusCode);
        throw ('Failed');
      }
    } catch (e) {
      print(e);
    }
  }

  static String movieVideoURL() {
    return 'https://www.youtube.com/watch?v=$movieVideoKey';
  }
}

class TVShow {
  static Map tvShowDetails;
  static String tvShowVideoKey;

  static Future getTVShowDetails(String tvShowID) async {
    try {
      http.Response response = await http.get(Uri.parse(
          'https://$kURL/tv/$tvShowID?api_key=$kMovieApiKey&language=en-US&append_to_response=credits,videos,recommendations'));

      if (response.statusCode == 200) {
        Map mapResponse = jsonDecode(response.body);

        tvShowDetails = mapResponse;

        for (var i = 0; i < tvShowDetails['videos']['results'].length; i++) {
          if (tvShowDetails['videos']['results'][i]['name'] ==
                  'Official Trailer' ||
              tvShowDetails['videos']['results'][i]['type'] == 'Trailer') {
            return tvShowVideoKey =
                tvShowDetails['videos']['results'][i]['key'];
          }
        }

        return tvShowDetails;
      } else {
        print(response.statusCode);
        throw ('Failed');
      }
    } catch (e) {
      print(e);
    }
  }

  static String tvShowVideoURL() {
    return 'https://www.youtube.com/watch?v=$tvShowVideoKey';
  }
}

String imagePath(String path) {
  return "https://image.tmdb.org/t/p/original/$path";
}

class PaymentMethods {
  bool subscribed = false;

  Future checkIfUserIsSubscribed(String email) async {
    List subscriptionList;
    try {
      http.Response response = await http.get(
          Uri.parse('https://api.paystack.co/subscription/'),
          headers: {'Authorization': kPaymentApiKey});

      if (response.statusCode == 200) {
        Map mapResponse = jsonDecode(response.body);
        subscriptionList = mapResponse['data'];

        for (var i = 0; i < subscriptionList.length; i++) {
          if (subscriptionList[i]['customer']['email'] == email) {
            subscribed = true;
          }
        }
        return subscribed;
      } else {
        print(response.statusCode);
        throw ('Failed');
      }
    } catch (e) {
      throw (e);
    }
  }

  static String authorizationURL;
  static String referenceCode;
  static Future initializePayment(String email) async {
    try {
      http.Response response = await http.post(
          Uri.parse('https://api.paystack.co/transaction/initialize'),
          headers: {'Authorization': kPaymentApiKey},
          body: jsonEncode({
            'email': email,
            'plan': kSubscriptionPlanCode,
            'amount': 20,
          }));

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map mapResponse = jsonDecode(response.body);
        authorizationURL = mapResponse['data']['authorization_url'];
        referenceCode = mapResponse['data']['reference'];
        print(authorizationURL);
        print(referenceCode);
      } else {
        print(response.statusCode);
        throw ('Failed');
      }
    } catch (e) {
      print(e);
    }
  }

  static bool paymentVerification;
  static Future verifyPayment(String code) async {
    try {
      http.Response response = await http.get(
          Uri.parse('https://api.paystack.co/transaction/verify/$code/'),
          headers: {'Authorization': kPaymentApiKey});

      if (response.statusCode == 200) {
        Map mapResponse = jsonDecode(response.body);

        if (mapResponse['data']['reference'] == code &&
            mapResponse['data']['gateway_response'] == 'Successful') {
          return paymentVerification = true;
        } else {
          return paymentVerification = false;
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
