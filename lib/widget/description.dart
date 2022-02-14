import 'package:first/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class description extends StatelessWidget {
  // const description({ Key? key }) : super(key: key);

  final String descriptioncont, bannerurl, posterurl, vote, adult, name
      // , launch_on
      ;

  const description({
    Key? key,
    required this.name,
    required this.descriptioncont,
    required this.bannerurl,
    required this.posterurl,
    required this.vote,
    required this.adult,
    // required this.launch_on
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              // color: Colors.red,
              height: 300,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 300,
                      width: double.infinity,
                      child: Image.network(
                        bannerurl,
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            color: Colors.black54,
                            child: Text(
                              "⭐ IMDB ratings " + vote,
                              style: TextStyle(fontSize: 19),
                            )),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  // color: Colors.amber,
                  height: 200,
                  width: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(child: Image.network(posterurl)),
                      SizedBox(
                        height: 20,
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                name == null ? "" : name,
                                style: TextStyle(fontSize: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                    onPressed: () async {
                                      final url =
                                          "https://www.youtube.com/results?search_query=" +
                                              "$name" +
                                              " trailer";
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      }
                                      print(url);

                                      if (url ==
                                          "https://www.youtube.com/results?search_query=trailer") {
                                        print("noname");
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.red),
                                    child: Text(" Watch Trailer ")),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Text(
                descriptioncont,
                style: TextStyle(fontSize: 20),
              )),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("adult $adult" == false ? "18 Above" : "Below 18")),
          ],
        ),
      ),
    );
  }
}
