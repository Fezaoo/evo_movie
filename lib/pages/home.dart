import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String search = '';
  String epa = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: SafeArea(
          child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
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
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchBar(
                    leading: Icon(Icons.search),
                    onChanged: (query) {setState(() {
                      search = query;
                    });},
                  ),
                  Text(
                    'testano $search',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ),
          ],
        ),
      )),
    );
  }
}
