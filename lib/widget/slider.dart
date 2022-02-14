import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class slider extends StatelessWidget {
  // const slider({Key? key}) : super(key: key);

  final List image = [
    'https://sportshub.cbsistatic.com/i/2022/01/13/8417257c-cf55-4e2d-83fe-cf9b00887497/uncharted-movie.jpg',
    'https://cdn.onebauer.media/one/empire-images/articles/56293c0b5f040ab527bd58ff/Final%20UK%20quad.jpg?format=jpg&quality=80&width=960&height=540&ratio=16-9&resize=aspectfill',
    'https://static1.colliderimages.com/wordpress/wp-content/uploads/2021/06/matrix-4.jpg',
    'https://webneel.net/file/images/11-16/8-xmen-movie-poster-design.jpg',
    'https://i.pinimg.com/originals/be/d6/3e/bed63e4fa1a1be8cea48b3c630218778.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        child: CarouselSlider(
          options: CarouselOptions(
              enlargeCenterPage: true, enableInfiniteScroll: true),
          items: image
              .map((e) => ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      fit: StackFit.passthrough,
                      children: [
                        Image.network(
                          e,
                          width: 1000,
                          height: 200,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
