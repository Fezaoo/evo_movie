import 'package:flutter/material.dart';
import 'package:evo_movie/services/moviedb.dart';

import '../models/movie.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}



class _HomeState extends State<Home> {

  
  @override
  void initState() {
    super.initState();
  }

  late List<Movie> data = [Movie(title: '', releaseDate: '')];
  String search = '';
  
  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)?.settings.arguments as List<Movie>;
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        backgroundColor: Colors.white12,
        title: Text(
          'Evo Movie',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SearchBar(
                    leading: Icon(Icons.search),
                    onChanged: (query) {setState(() {
                      search = query;
                    });},
                  ),
                  Text(
                    'testano ${data[0].title}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                   
                ],
              )
          ],
        ),
      )),
    );
  }
}
