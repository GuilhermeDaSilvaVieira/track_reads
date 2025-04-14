import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_pallete.dart';
import '../../../../core/theme/bloc/theme_bloc.dart';

class StarRating extends StatelessWidget {
  final double rating;

  const StarRating({
    super.key,
    required this.rating,
  });

  Widget buildStarRating(double rating, Color color) {
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      if (rating >= i) {
        stars.add(
          Icon(
            Icons.star,
            color: color,
          ),
        );
      } else if (rating >= i - 0.5) {
        stars.add(
          Icon(
            Icons.star_half,
            color: color,
          ),
        );
      } else {
        stars.add(
          Icon(
            Icons.star_border,
            color: color,
          ),
        );
      }
    }
    return Row(children: stars);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeBloc>().state
        ? AppPallete.darkStars
        : AppPallete.lightStars;
    return buildStarRating(rating, isDark);
  }
}
