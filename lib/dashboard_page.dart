import 'package:emoji_ui_app/burger_page.dart';
import 'package:emoji_ui_app/food_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            // app bar area
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 6.0,
                          spreadRadius: 4.0,
                          offset: Offset(0, 3),
                        ),
                      ],
                      shape: BoxShape.circle,
                      color: Color(0xFFC6E7FE),
                      image: DecorationImage(
                        image: AssetImage('assets/tuxedo.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //search area
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 50, top: 10, bottom: 20),
                      child: Text(
                        'Search for\nRecipes',
                        style: GoogleFonts.notoSans(
                          fontWeight: FontWeight.w800,
                          letterSpacing: -2,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  width: 360,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.search_rounded,
                        color: Colors.grey,
                      ),
                      labelText: 'search',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),

            // recommended area
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Recommended',
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w100, fontSize: 22),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 200,
                  child: ListView(
                    padding: EdgeInsets.only(left: 15),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildItemList('Burger', 'assets/burger.png', '9.90',
                          Colors.orangeAccent.shade100, Colors.black),
                      _buildItemList('Hotdog', 'assets/hotdog.png', '5.90',
                          Colors.lightBlue.shade100, Colors.black),
                      _buildItemList('Pizza', 'assets/pizza.png', '9.90',
                          Colors.lightGreen.shade100, Colors.black),
                      _buildItemList('Fries', 'assets/fries.png', '2.90',
                          Colors.redAccent.shade100, Colors.black),
                    ],
                  ),
                ),
              ],
            ),

            // tab bar featured area
            SizedBox(
              height: 10,
            ),
            TabBar(
              onTap: (int index) {
                ///todo add a function here
              },
              controller: tabController,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.5),
              labelStyle: GoogleFonts.notoSans(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelStyle: GoogleFonts.notoSans(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              tabs: [
                Tab(
                  child: Text(
                    'FEATURED',
                    style: GoogleFonts.notoSans(fontWeight: FontWeight.w700),
                  ),
                ),
                Tab(
                  child: Text(
                    'COMBO',
                    style: GoogleFonts.notoSans(fontWeight: FontWeight.w700),
                  ),
                ),
                Tab(
                  child: Text(
                    'FAVOURITES',
                    style: GoogleFonts.notoSans(fontWeight: FontWeight.w700),
                  ),
                ),
                Tab(
                  child: Text(
                    'RECOMMENDED',
                    style: GoogleFonts.notoSans(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ), //tab bar
            Container(
              height: MediaQuery.of(context).size.height - 450,
              child: TabBarView(
                controller: tabController,
                children: [
                  FoodTab(),
                  FoodTab(),
                  FoodTab(),
                  FoodTab(),
                ],
              ),
            ), //tab bar children list
          ],
        ),
      ),
    );
  }

  _buildItemList(String foodName, String imgPath, String price, Color bgColor,
      Color textColor) {
    return Padding(
      padding: EdgeInsets.only(right: 18),
      child: InkWell(
        onTap: () {
          //todo 1: go to card function.
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BurgerPage(
                  foodName: foodName,
                  imgPath: imgPath,
                  price: price,
                ),
              ));
        },
        child: Container(
          height: 175,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: bgColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: foodName,
                child: Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      imgPath,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                foodName,
                style: GoogleFonts.notoSans(
                  fontSize: 17,
                  color: textColor,
                ),
              ),
              Text(
                'RM $price',
                style: GoogleFonts.notoSans(
                  fontSize: 17,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
