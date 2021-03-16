import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:meals_foodapp/constants/color_constant.dart';
import 'package:meals_foodapp/constants/style_constant.dart';
import 'package:meals_foodapp/model/carousel_model.dart';
import 'package:meals_foodapp/model/popular_order_model.dart';
import 'package:meals_foodapp/model/popular_restaurant_model.dart';
import 'package:meals_foodapp/widget/bottom_navigation_meals.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(
        handler(i, list[i]),
      );
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset('assets/icons/menubar.svg'),
            SvgPicture.asset('assets/svg/logo_meals.svg')
          ],
        ),
        elevation: 0,
      ),
      // set background
      backgroundColor: mBackgroundColor,
      // bottom navigation
      bottomNavigationBar: BottomNavigationMeals(),
      // body
      body: Container(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            // promo section
            Padding(
              padding: EdgeInsets.only(left: 16, bottom: 20),
              child: Text(
                'Hei Felix 👋 this promo’s for you!',
                style: mPromoStyle,
              ),
            ),
            Container(
              // carousel
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 16, right: 16),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 144,
                    child: Swiper(
                      onIndexChanged: (index) {
                        setState(() {
                          _current = index;
                        });
                      },
                      autoplay: true,
                      layout: SwiperLayout.DEFAULT,
                      itemCount: carousels.length,
                      itemBuilder: (BuildContext context, index) {
                        return Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: AssetImage(carousels[index].image),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Positioned(
                              child:
                                  SvgPicture.asset('assets/svg/mark_meals.svg'),
                              right: -1,
                              top: -2,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: map<Widget>(
                          carousels,
                          (index, image) {
                            return Container(
                              alignment: Alignment.centerLeft,
                              height: 6,
                              width: 6,
                              margin: EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _current == index
                                      ? mYellowColor
                                      : mGreyColor),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 16, bottom: 12, top: 20, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Let\'s Order!',
                    style: mTitleStyle,
                  ),
                  Text(
                    'More..',
                    style: mMoreStyle,
                  )
                ],
              ),
            ),
            Container(
              height: 144,
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 60,
                          decoration: BoxDecoration(
                            color: mBackgroundColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor, width: 1),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svg/pizza_icon.svg',
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Pizza',
                                      style: mNameCategoryMenuStyle,
                                    ),
                                    Text(
                                      'All varian\'s pizza',
                                      style: mDescCategoryMenuStyle,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 16),
                          height: 60,
                          decoration: BoxDecoration(
                            color: mBackgroundColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor, width: 1),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svg/cake_icon.svg',
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Dessert',
                                      style: mNameCategoryMenuStyle,
                                    ),
                                    Text(
                                      'A slice of heaven',
                                      style: mDescCategoryMenuStyle,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 60,
                          decoration: BoxDecoration(
                            color: mBackgroundColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor, width: 1),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svg/burger_icon.svg',
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Burger',
                                      style: mNameCategoryMenuStyle,
                                    ),
                                    Text(
                                      'Delicious burger is here',
                                      style: mDescCategoryMenuStyle,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 16),
                          height: 60,
                          decoration: BoxDecoration(
                            color: mBackgroundColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor, width: 1),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svg/pasta_icon.svg',
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Pasta',
                                      style: mNameCategoryMenuStyle,
                                    ),
                                    Text(
                                      'All the pasta menu\'s',
                                      style: mDescCategoryMenuStyle,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),

            // Popular Order
            Padding(
              padding:
                  EdgeInsets.only(left: 16, bottom: 12, top: 10, right: 16),
              child: Text(
                'Popular Order\'s',
                style: mTitleStyle,
              ),
            ),
            Container(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16, right: 16),
                itemCount: populars.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          height: 160,
                          width: 140,
                          decoration: BoxDecoration(
                            color: const Color(0xFF000000),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: mBorderColor, width: 1),
                            image: DecorationImage(
                                image: AssetImage(populars[index].image),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.17),
                                    BlendMode.darken)),
                          ),
                        ),
                        Positioned(
                          child: SvgPicture.asset(
                            'assets/svg/mask_top.svg',
                          ),
                          right: 0,
                          top: -1,
                        ),
                        Positioned(
                          bottom: 12,
                          child: Padding(
                            padding: EdgeInsets.only(right: 8, left: 8),
                            child: Text(
                              populars[index].name,
                              maxLines: 2,
                              style: mNameMenuStyle,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),

            // Popular Restaurant
            Padding(
              padding:
                  EdgeInsets.only(left: 16, bottom: 12, top: 15, right: 16),
              child: Text(
                'Popular Restaurant\'s',
                style: mTitleStyle,
              ),
            ),
            Container(
              height: 151,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 16),
                itemCount: restaurants.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 8),
                    width: 258,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 151,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: mBorderColor, width: 1),
                                image: DecorationImage(
                                    image: AssetImage(restaurants[index].image),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: -1,
                              child:
                                  SvgPicture.asset('assets/svg/mask_top.svg'),
                            ),
                            Positioned(
                              left: 16,
                              bottom: 20,
                              child: Text(
                                restaurants[index].name,
                                style: mNameMenuStyle,
                              ),
                            ),
                            Positioned(
                              bottom: 8,
                              left: 16,
                              child: Text(
                                restaurants[index].place,
                                style: mPlaceStyle,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
