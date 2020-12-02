import 'package:emoji_ui_app/food_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class BurgerPage extends StatefulWidget {
  final String foodName;
  final String price;
  final String imgPath;
  final String heroTag;

  BurgerPage({this.price, this.imgPath, this.foodName, this.heroTag});

  @override
  _BurgerPageState createState() => _BurgerPageState();
}

class _BurgerPageState extends State<BurgerPage> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //top app bar
                Icon(Icons.menu, color: Colors.black),
                Stack(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      color: Colors.transparent,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFFE7D6A),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 9,
                            spreadRadius: 9,
                            offset: Offset(0, 4),
                            color: Colors.grey.shade300,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(Icons.shopping_cart_outlined,
                            color: Colors.white),
                      ),
                    ),
                    Positioned(
                      top: 1.0,
                      right: 4.0,
                      child: Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '1',
                            style: GoogleFonts.notoSans(
                              fontSize: 7,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // product section
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'SUPER',
              style: GoogleFonts.notoSans(
                fontSize: 27,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              '${widget.foodName.toUpperCase()}',
              style: GoogleFonts.notoSans(
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          //product section image
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 25),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.imgPath),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 25, bottom: 15),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          spreadRadius: 4,
                          color: Colors.grey.shade300,
                        ),
                      ],
                    ),
                    child: Icon(
                      MaterialIcons.favorite_border,
                      color: Colors.red,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 25, bottom: 15),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          spreadRadius: 4,
                          color: Colors.grey.shade300,
                        ),
                      ],
                    ),
                    child: Icon(
                      MaterialIcons.timer,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 25),
          //price section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 18.0),
                child: Text(
                  'RM ${widget.price}',
                  style: GoogleFonts.notoSans(
                    fontSize: 30,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
              Container(
                width: 220,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.pinkAccent.shade100,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        width: 110,
                        height: 55,
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.remove,
                                color: Colors.red,
                                size: 18,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (quantity > 0) {
                                    quantity--;
                                  }
                                });
                              },
                            ),
                            Text(
                              '${quantity.toString()}',
                              style: GoogleFonts.notoSans(
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.red,
                                size: 18,
                              ),
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      'Add to cart',
                      style: GoogleFonts.notoSans(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          //featured section below
          SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(
              'FEATURED',
              style: GoogleFonts.notoSans(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Container(
            child: ListView(
              shrinkWrap: true,
              children: [
                _buildItemList('Delicious Taco', 5, '5.90', 'assets/taco.png'),
              ],
            ),
          ),
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
