import 'package:flutter/material.dart';
import 'package:evo_movie/models/movie.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:http/http.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    print(movie.posterLink);
    return Scaffold(
        backgroundColor: Colors.white12,
        appBar: AppBar(
          backgroundColor: Colors.white12,
          title: Text(
            movie.title,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (movie.posterLink != null)
                          Container(
                            color: Colors.white12,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                ),
                                Image.network(
                                  movie.posterLink!,
                                  // Propriedades opcionais:
                                  width: 150,
                                  fit: BoxFit.cover,
                                  // Ajusta a imagem para cobrir o espaço disponível
                                  loadingBuilder: (context, child, progress) {
                                    return progress == null
                                        ? child
                                        : CircularProgressIndicator();
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(Icons
                                        .error); // Mostra um ícone de erro se a imagem não carregar
                                  },
                                ),
                              ],
                            ),
                          ),
                        SizedBox(
                          height: 20,
                        ),
                        // Text('Título:',
                        //     style: Theme.of(context).textTheme.bodyLarge),
                        Text(movie.title,
                            style: Theme.of(context).textTheme.bodyLarge),
                        RatingStars(
                          value: movie.voteAverage,
                          starSize: 15,
                          maxValue: 10,
                          starCount: 10,
                        ),

                        if (movie.releaseDate != null)
                          Text('Lançamento: ',
                              style: Theme.of(context).textTheme.bodyLarge),
                        Text(
                            '${movie.releaseDate!.day}/${movie.releaseDate!.month}/${movie.releaseDate!.year}',
                            style: Theme.of(context).textTheme.bodyMedium),
                        Divider(
                          height: 10,
                        ),
                        Text('Sinopse:',
                            style: Theme.of(context).textTheme.bodyLarge),
                        Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 0.8, color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          padding: EdgeInsets.all(10),
                          child: Text(movie.overView,
                              style: Theme.of(context).textTheme.bodyMedium),
                        ),
                        if (movie.runTime != null)
                          Text('Duração: ${movie.runTime} min',
                              style: Theme.of(context).textTheme.bodyLarge),
                        // if (movie.voteAverage != null)
                        //   Text('Votos: ${movie.voteAverage}',
                        //       style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                  ))),
        ));
  }
}
