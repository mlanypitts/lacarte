import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewsWidget extends StatelessWidget {
  const ReviewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      width: 328,
      height: 280,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                    left: 22,
                    top: 22,
                    child: Row(
                      children: [
                        const ProfilePicture(
                          name: "John Wick",
                          radius: 26,
                          fontsize: 16,
                          random: true,
                        ),
                        const SizedBox(width: 10),
                        RatingBar.builder(
                          initialRating: 4.5,
                          minRating: 4.5,
                          itemSize: 22,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 22, top: 86),
                    child: Text(
                      'I had a great time eating delicious food at your restaurant. The atmosphere was awesome and I definitely liked that you have a very modern style.',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Positioned(
                    left: 22,
                    top: 22,
                    child: Row(
                      children: [
                        const ProfilePicture(
                          name: "Tyler Rake",
                          radius: 26,
                          fontsize: 16,
                          random: true,
                        ),
                        const SizedBox(width: 10),
                        RatingBar.builder(
                          initialRating: 4,
                          minRating: 4,
                          itemSize: 22,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 22, top: 86),
                    child: Text(
                      'Very nice place. Food was good. Presentation could be a little more creative, but other than that, I would eat here again.',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}