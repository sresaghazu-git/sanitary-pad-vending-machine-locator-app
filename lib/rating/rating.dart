import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final double rating;
  const Rating({super.key, this.rating = 0});
  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];

    for (var x = 0; x < rating.ceil(); x++) {
      if ((rating - rating.floor()) > 0 && x == (rating.ceil() - 1)) {
        stars.add(const Icon(
          Icons.star_half,
          color: Colors.amber,
          size: 15,
        ));
      } else {
        stars.add(const Icon(
          Icons.star,
          color: Colors.amber,
          size: 15,
        ));
      }
    }

    for (var x = 0; x < 5 - rating.ceil(); x++) {
      stars.add(const Icon(
        Icons.star_border,
        color: Colors.amber,
        size: 15,
      ));
    }

    return Row(
      children: [
        ...stars,
        const SizedBox(
          width: 10,
        ),
        Text(
          rating.toString(),
          style: const TextStyle(color: Colors.blueGrey),
        )
      ],
    );
  }
}
