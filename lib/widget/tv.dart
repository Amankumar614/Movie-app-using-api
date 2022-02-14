import 'package:first/widget/description.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

class tv_show extends StatelessWidget {
  // const tranding_movie({Key? key}) : super(key: key);

  final List tvList;

  const tv_show({Key? key, required this.tvList}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Tranding shows",
              style: TextStyle(fontSize: 25),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => InkWell(
                
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => description(
                            
                                name: tvList[index]['original_name'],
                                descriptioncont: tvList[index]['overview'],
                                bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                    tvList[index]['backdrop_path'],
                                posterurl: 'https://image.tmdb.org/t/p/w500' +
                                    tvList[index]['poster_path'],
                                vote: tvList[index]['vote_average'].toString(),
                                adult: tvList[index]['adult'].toString(),
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
                                          tvList[index]['poster_path']))),
                        ),
                      ),
                      // Container(
                      //     child: Text(curtranding[index]["original_name"]
                      //         ? 'loading'
                      //         : curtranding[index]["original_name"])),
                    ],
                  ),
                ),
              ),
              itemCount: tvList.length,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}
