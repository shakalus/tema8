import 'dart:convert';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tema7/src/models/index.dart';

class MovieApi {
  const MovieApi(this._client, this._preferences);

  final Client _client;
  final SharedPreferences _preferences;

  Future<List<Movie>> getMovies(int page) async {
    final Response response = await _client.get(
      Uri.parse(
        'https://yts.mx/api/v2/list_movies.json?limit=20&page=$page',
      ),
    );

    final Map<String, dynamic> body = jsonDecode(response.body) as Map<String, dynamic>;
    final Map<String, dynamic> data = body['data'] as Map<String, dynamic>;

    return (data['movies'] as List<dynamic>)
        .map((dynamic item) => Movie.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<void> updateLike(int id, {required bool like}) async {
    final String key = '$id';
    if (like) {
      await _preferences.setInt(key, id);
    } else {
      await _preferences.remove(key);
    }
  }
}
