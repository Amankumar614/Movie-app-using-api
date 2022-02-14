import 'package:first/widget/description.dart';
import 'package:first/widget/tv.dart';
import 'package:flutter/material.dart';

class newMovies extends StatelessWidget {
  // const newMovies({Key? key}) : super(key: key);

  final List newmov;

  const newMovies({Key? key, required this.newmov}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text(
                "Latest movies",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          Container(
            height: 250,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => description(
                                name: newmov[index]['original_title'],
                                descriptioncont: newmov[index]['overview'],
                                bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                    newmov[index]['backdrop_path'],
                                posterurl: 'https://image.tmdb.org/t/p/w500' +
                                    newmov[index]['poster_path'],
                                vote: newmov[index]['vote_average'].toString(),
                                adult: newmov[index]['adult'].toString(),
                                // launch_on: curtranding[index]['release_date']
                                //     ? curtranding[index]['release_date']
                                //     : "loading")
                              )));
                },
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Container(
                          width: 200,
                          height: 250,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          newmov[index]['poster_path']))),
                        ),
                      ),
                      // Container(child: Text(curtranding[0]["title"]))
                    ],
                  ),
                  height: 250,
                  width: 170,
                ),
              ),
              itemCount: newmov.length,
            ),
          )
        ],
      ),
    );
  }
}
