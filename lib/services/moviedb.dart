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
        title: data[c]['title'],
        posterLink: data[c]['poster_path'],
        backLink: data[c]['backdrop_path'],
        releaseDate: data[c]['release_date'],
        homePage: data[c]['homepage'],
        overView: data[c]['overview'],
        runTime: data[c]['runtime'],
        voteAverage: data[c]['vote_average'],
        voteCount: data[c]['vote_count'],
      );
      foundMovies.add(movie);
    }
    for (int i = 0; i < foundMovies.length; i++){
      for (int j = i+1; j < foundMovies.length; j++){
        if (foundMovies[i].releaseDate != null && foundMovies[j].releaseDate != null){
          int comparison = foundMovies[i].releaseDate!.year.compareTo(foundMovies[j].releaseDate!.year);
          if (comparison == -1){
            var aux = foundMovies[i];
             foundMovies[i] = foundMovies[j];
             foundMovies[j] = aux;
          }
          else if (comparison == 0 && foundMovies[i].title.compareTo(foundMovies[j].title) > 0 ){
            var aux = foundMovies[i];
            foundMovies[i] = foundMovies[j];
            foundMovies[j] = aux;
          }
        }
      }
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
        'https://api.themoviedb.org/3/movie/${stringMovieId}?language=pt-BR&api_key=${dotenv
            .env['API_KEY']}')));
    Map data = jsonDecode(response.body);
    Movie movie = Movie( title:  '', releaseDate: '0000-00-00', overView: '', voteAverage: -1, voteCount: 0);
    if (data['title'] != null && data['release_date'] != null) {
      movie = Movie(
          title: data['title'],
          posterLink: data['poster_path'],
          backLink: data['backdrop_path'],
          releaseDate: data['release_date'],
          homePage: data['homepage'],
          overView: data['overview'],
          runTime: data['runtime'],
          voteAverage: data['vote_average'],
          voteCount: data['vote_count'],
      );
    }
    return movie;
  }


}