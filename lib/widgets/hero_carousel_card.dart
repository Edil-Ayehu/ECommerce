import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HeroCarouselCard extends StatelessWidget {
  final String productImageUrl;

  HeroCarouselCard({required this.productImageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: productImageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                errorWidget: (context, url, error) => const Image(
                  image: AssetImage('images/error1.jpg'),
                  fit: BoxFit.cover,
                ),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
              ),
            ],
          )),
    );
  }
}
