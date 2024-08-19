import 'package:evo_movie/models/movie.dart';
import 'package:evo_movie/services/moviedb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {


  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupInitialMovies() async{

    MovieDb instance = MovieDb();
    var response = await instance.getInitialMovies();
    List<Movie> data = response.toList();
    Navigator.pushReplacementNamed(context, '/home', arguments: data );
  }

  @override
  void initState() {
    super.initState();
    setupInitialMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitFadingCircle(
          size: 60,
          color: Colors.white,
        ),
      ),
    );
  }
}
