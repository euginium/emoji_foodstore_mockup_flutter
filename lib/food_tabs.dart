import 'package:emoji_ui_app/burger_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FoodTab extends StatefulWidget {
  @override
  _FoodTabState createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 15, right: 15),
        children: [
          _buildItemList('Delicious Taco', 5, '5.90', 'assets/taco.png'),
          _buildItemList('Spicy Pizza', 5, '9.90', 'assets/pizza.png'),
          _buildItemList('Mega Fries', 4, '3.90', 'assets/fries.png'),
          _buildItemList('Sweety Popcorn', 5, '3.90', 'assets/popcorn.png'),
          _buildItemList('Light Sandwich', 4, '3.90', 'assets/sandwich.png'),
        ],
      ),
    );
  }

  _buildItemList(String foodName, int rating, String price, String imgPath) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          // images and details
          Flexible(
            child: Container(
              child: Row(
                children: [
                  Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Color(0xFFFFE3DF),
                    ),
                    child: Center(
                      child: Image.asset(imgPath, height: 50, width: 50),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        foodName,
                        style: GoogleFonts.notoSans(),
                      ),
                      SmoothStarRating(
                        rating: rating.toDouble(),
                        starCount: rating,
                        onRated: (double value) {
                          //todo add staring function
                        },
                        color: Color(0xFFFFD143),
                        size: 15,
                        spacing: 0,
                        allowHalfRating: true,
                      ),
                      Text(
                        'RM ${price}',
                        style: GoogleFonts.notoSans(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          //floating action button
          Container(
            child: FloatingActionButton(
              elevation: 3,
              backgroundColor: Color(0xFFFE7D6A),
              heroTag: foodName,
              mini: true,
              onPressed: () {
                // todo add to cart functions
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BurgerPage(
                      foodName: foodName,
                      price: price,
                      imgPath: imgPath,
                    ),
                  ),
                );
              },
              child: Center(
                child: Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
