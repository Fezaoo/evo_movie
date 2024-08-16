import 'dart:convert';

import 'package:evo_movie/models/movie.dart';
import 'package:http/http.dart';

class MovieDb{



  Future<List<Movie>> getInitialMovies() async{
    Response response = await get((Uri.parse('https://api.themoviedb.org/3/movie/11?api_key=7687e8cb29740b81c35f99f85022ae50')));
    Map data = jsonDecode(response.body);
    Movie starWars = Movie(title: data['title'], releaseDate: data['release_date']);
    print(starWars.title);
    print(starWars.releaseDate);
    List<Movie> initialList = [];
    initialList.add(starWars);
    return initialList;
  }
}