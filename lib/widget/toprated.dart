import 'package:first/widget/description.dart';
import 'package:flutter/material.dart';

class toprated_show extends StatelessWidget {
  // const toprated_show({Key? key}) : super(key: key);

  final List topshowlist;

  const toprated_show({Key? key, required this.topshowlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text(
                "Top rated shows",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: topshowlist.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => description(
                                  descriptioncont: topshowlist[index]
                                      ['overview'],
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      topshowlist[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      topshowlist[index]['poster_path'],
                                  vote: topshowlist[index]['vote_average']
                                      .toString(),
                                  adult: topshowlist[index]['adult'].toString(),
                                  name: topshowlist[index]['original_title'],
                                  // launch_on: curtranding[index]['release_date']
                                  //     ? curtranding[index]['release_date']
                                  //     : "loading")
                                )));
                  },
                  child: Container(
                    height: 250,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Container(
                            width: 170,
                            height: MediaQuery.of(context).size.height * 0.3,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            topshowlist[index]
                                                ['poster_path']))),
                          ),
                        ),
                        // Container(child: Text(curtranding[0]["title"]))
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
