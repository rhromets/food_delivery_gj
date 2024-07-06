import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:food_delivery_gj/utils/colors.dart';
import 'package:food_delivery_gj/utils/dimentions.dart';
import 'package:food_delivery_gj/widgets/widgets.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(
    viewportFraction: 0.85,
  );
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slider section
        SizedBox(
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            },
          ),
        ),
        // dots
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue.round(),
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            activeColor: AppColors.mainColor,
          ),
        ),
        // popular section header
        SizedBox(height: Dimensions.height30),
        Container(
          margin: EdgeInsets.only(
              left: Dimensions.width30, bottom: Dimensions.width20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const BigText(text: 'Popular'),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: const BigText(
                  text: '.',
                  color: Colors.black26,
                ),
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: const SmallText(text: 'Food pairing'),
              ),
            ],
          ),
        ),
        // popular section body
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height5,
                ),
                child: Row(
                  children: [
                    Container(
                      width: Dimensions.listViewImgSize,
                      height: Dimensions.listViewImgSize,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white38,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/food0.png'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: Dimensions.listViewTextContSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(
                              (Dimensions.radius20),
                            ),
                            bottomRight: Radius.circular(
                              (Dimensions.radius20),
                            ),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.width10),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(text: 'Nutritious fruit meal in China'),
                              SmallText(text: 'With chinese characteristics'),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconAndTxtWidget(
                                    icon: Icons.circle_sharp,
                                    text: 'Normal',
                                    iconColor: AppColors.iconColor1,
                                  ),
                                  IconAndTxtWidget(
                                    icon: Icons.location_on,
                                    text: '1.7km',
                                    iconColor: AppColors.mainColor,
                                  ),
                                  IconAndTxtWidget(
                                    icon: Icons.access_time_rounded,
                                    text: '32min',
                                    iconColor: AppColors.iconColor2,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            })
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven
                  ? const Color(0xFF69c5df)
                  : const Color(0xFF9294cc),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/food0.png'),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.symmetric(
                horizontal: Dimensions.width30,
                vertical: Dimensions.height40,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    ),
                  ]),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width15),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppColumn(text: 'Chinese Side'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
