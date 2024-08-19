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

  Future<List<Movie>> searchMovies (String query) async {
    return await instance.searchMovies(query);
  }

  String search = '';
  MovieDb instance = MovieDb();
  List<Movie> data = [];
  String homeSubTitle = 'Filmes em destaque';



  @override
  Widget build(BuildContext context) {

    if (data.isEmpty) {
      data = ModalRoute
          .of(context)
          ?.settings
          .arguments as List<Movie>;
    }

    return Scaffold(
        backgroundColor: Colors.white12,
        appBar: AppBar(
          backgroundColor: Colors.white12,
          title: Text(
            'Evo Movie',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                SearchBar(
                  leading: Icon(Icons.search),
                  onChanged: (query) {
                    setState(() {
                      search = query;
                    });
                  },
                  onSubmitted: (query) async{
                    print('opaaaa');
                    var searchResponse = await searchMovies(search);
                    setState((){
                      data = searchResponse;
                      homeSubTitle = ' ${data.length} Filmes econtrados: ';
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    homeSubTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold

                    ),

                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  data[index].title,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              SizedBox(width: 15,),
                              Text(
                                data[index].releaseDate,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )),
        ));
  }
}
