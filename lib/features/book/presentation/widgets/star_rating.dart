import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;

  const StarRating({
    super.key,
    required this.rating,
  });

  Widget buildStarRating(double rating) {
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      if (rating >= i) {
        stars.add(
          const Icon(
            Icons.star,
            color: Colors.amber,
          ),
        );
      } else if (rating >= i - 0.5) {
        stars.add(
          const Icon(
            Icons.star_half,
            color: Colors.amber,
          ),
        );
      } else {
        stars.add(
          const Icon(
            Icons.star_border,
            color: Colors.amber,
          ),
        );
      }
    }
    return Row(children: stars);
  }

  @override
  Widget build(BuildContext context) {
    return buildStarRating(rating);
  }
}
