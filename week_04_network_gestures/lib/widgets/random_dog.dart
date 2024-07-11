import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

class RandomDogImage extends StatefulWidget {
  const RandomDogImage({super.key});

  @override
  State<RandomDogImage> createState() => _RandomDogImageState();
}

class _RandomDogImageState extends State<RandomDogImage> {
  var dogImageUrl = '';
  var likes = 0;
  var dislikes = 0;

  Future<String> getRandomDogUrl() async {
    const dogEndpoint = 'https://dog.ceo/api/breeds/image/random';
    var response = await get(Uri.parse(dogEndpoint));
    return await jsonDecode(response.body)['message'];
  }

  @override
  void initState() {
    super.initState();
    // Perform any specific initialization necessary
    getRandomDogUrl().then((url) {
      setState(() {
        dogImageUrl = url;
      });
    });
  }

  Widget _buildDogImage() {
    return GestureDetector(
      onTap: () {
        getRandomDogUrl().then((url) {
          setState(() {
            dogImageUrl = url;
            likes += 1;
          });
        });
      },
      onLongPress: () {
        getRandomDogUrl().then((url) {
          setState(() {
            dogImageUrl = url;
            dislikes += 1;
          });
        });
      },
      child: dogImageUrl == ''
          ? const Text('Loading...')
          : Image.network(dogImageUrl),
    );
  }

  @override
  build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildDogImage(),
        LikeText(
          isLike: true,
          count: likes,
        ),
        LikeText(
          isLike: false,
          count: dislikes,
        ),
      ],
    );
  }
}

class LikeText extends StatelessWidget {
  final bool isLike;
  final int count;

  const LikeText({this.isLike = true, this.count = 0, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          top: 16.0,
          left: 16.0,
        ),
        child: Row(
          children: <Widget>[
            Text(
              isLike ? 'Likes: ' : 'Dislikes: ',
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$count',
              style: const TextStyle(
                fontSize: 24.0,
              ),
            )
          ],
        ));
  }
}
