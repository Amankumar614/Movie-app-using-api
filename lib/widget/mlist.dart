import 'dart:async';

import 'package:first/widget/newtv.dart';
import 'package:first/widget/slider.dart';
import 'package:first/widget/toprated.dart';
import 'package:first/widget/tranding.dart';
import 'package:first/widget/tv.dart';
import 'package:flutter/material.dart';

import 'package:tmdb_api/tmdb_api.dart';

class mlist extends StatefulWidget {
  const mlist({Key? key}) : super(key: key);

  @override
  _mlistState createState() => _mlistState();
}

class _mlistState extends State<mlist> {
  List tradingmov = [];
  List toprated = [];
  List tvresult = [];
  List newmov = [];
  final String api = "c29024508ac7d8ef2e29a8042d23fbf0";
  final readacc =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMjkwMjQ1MDhhYzdkOGVmMmUyOWE4MDQyZDIzZmJmMCIsInN1YiI6IjYxZmVjOTY1MDI1NzY0MDAxZjhhOGFhYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.CWsoQPJbCFqlf-M0zuaUtV5xdk3aDVDEUmEOacBnQG0";

  loadmovies() async {
    TMDB tmdbcutomlogs = TMDB(ApiKeys(api, readacc),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map tradingres = await tmdbcutomlogs.v3.trending.getTrending();
    Map topratedmap = await tmdbcutomlogs.v3.movies.getTopRated();
    Map tvresultmap = await tmdbcutomlogs.v3.tv.getPopular();
    Map newmovmap = await tmdbcutomlogs.v3.movies.getUpcoming();

    setState(() {
      tradingmov = tradingres["results"];
      toprated = topratedmap["results"];
      tvresult = tvresultmap["results"];
      newmov = newmovmap["results"];
    });
  }

  bool isloading = true;
  loading() async {
    await Future.delayed(Duration(seconds: 3));
    isloading = false;
  }

  @override
  void initState() {
    loadmovies();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(tradingmov[1]['name']);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MOvie aPP",
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "MOVIES APP ❤️",
          ),
        ),
        body: Container(
          child: Center(
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                slider(),
                tranding_movie(
                  curtranding: tradingmov,
                ),
                toprated_show(
                  topshowlist: toprated,
                ),
                tv_show(tvList: tvresult),
                newMovies(newmov: newmov),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
