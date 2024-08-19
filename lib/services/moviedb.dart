import 'dart:convert';
import 'package:evo_movie/models/movie.dart';
import 'package:http/http.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MovieDb {

  Future<List<Movie>> searchMovies(String query) async {
    await dotenv.load(fileName: ".env");
    Response response = await get(Uri.parse('https://api.themoviedb.org/3/search/movie?query=${query}&include_adult=false&language=pt-BR&page=1&api_key=${dotenv.env['API_KEY']}'));
    Map bruteData = jsonDecode(response.body);
    List data = bruteData['results'];
    List<Movie> foundMovies = [];
    for (int c = 0; c < data.length; c++){
      Movie movie = Movie(
          title: data[c]['title'], releaseDate: data[c]['release_date']);
      foundMovies.add(movie);
    }
    return foundMovies;
  }

  Future<List<Movie>> getInitialMovies() async {
    await dotenv.load(fileName: ".env");
    List<Movie> initialList = [];

    for (var c = 6; initialList.length < 6; c++) {
      Movie movieToAdd = await getMovie(c.toString());
      if (movieToAdd.title != '') {
      initialList.add(movieToAdd);

      }
    }
    return initialList;
  }

  Future<Movie> getMovie(String stringMovieId) async{
    Response response = await get((Uri.parse(
        'https://api.themoviedb.org/3/movie/${stringMovieId}?api_key=${dotenv
            .env['API_KEY']}')));
    Map data = jsonDecode(response.body);
    Movie movie = Movie(title: '', releaseDate: '');
    if (data['title'] != null && data['release_date'] != null) {
      movie = Movie(
          title: data['title'], releaseDate: data['release_date']);
    }
    return movie;
  }
}