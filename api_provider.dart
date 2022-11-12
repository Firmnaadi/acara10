import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import 'package:acara35/model/popular_movies.dart';

class ApiProvider {
  String apiKey = 'c07cf5d19cfce327452b8d9c50a46e16';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async {
    Response response =
        await client.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));

    if (response.statusCode == 200) {
      return PopularMovies.formJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
