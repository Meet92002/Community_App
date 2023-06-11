import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../components/app_bar_const.dart';
import '../../../../../components/text_const.dart';
import '../../../../../utils/color_const.dart';
import '../../../../../utils/image_const.dart';

class BuySellScreen extends StatefulWidget {
  const BuySellScreen({Key? key}) : super(key: key);

  @override
  State<BuySellScreen> createState() => _BuySellScreenState();
}

class _BuySellScreenState extends State<BuySellScreen> {

  List<String> carouselImages = [
    AssetImageConst.offer1,
    AssetImageConst.offer2,
    AssetImageConst.offer3
  ];

  List<String> category = [
    AssetImageConst.car,
    AssetImageConst.bike,
    AssetImageConst.electronics,
    AssetImageConst.kitchen,
    AssetImageConst.cloth,
    AssetImageConst.homeAppliances,
    AssetImageConst.proprty,
    AssetImageConst.sale,
  ];

  List<String> categoryName = [
    "Car",
    "Bike",
    "Electronics",
    "Kitchen",
    "Clothes",
    "Home",
    "Property",
    "Sale"
  ];

  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarConst(
          text: 'Buy - Sell',
          backgroundColor: Colors.white,
          elevation: 5,
          centerTitle: true,
          icon: Icons.arrow_back_rounded,
          iconColor: Colors.black,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 05,left: 05,right: 05),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 05,right: 05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextConst(
                          text: 'Category',
                          fontFamily: 'Poppins',
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          textAlign: TextAlign.start,
                        ),
                        TextConst(
                          text: 'View All',
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black45,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 645,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 05,
                          crossAxisSpacing: 18,
                          mainAxisExtent: 105,
                        ),
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                radius: 31,
                                backgroundColor: Colors.black.withOpacity(.2),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  child: Image.asset(
                                    category[index],
                                    filterQuality: FilterQuality.high,
                                    width: 38,
                                    height: 38,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 05,
                              ),
                              SizedBox(
                                height: 38,
                                child: TextConst(
                                  text: categoryName[index],
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 05),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      viewportFraction: 1,
                      enlargeCenterPage: false,
                      autoPlay: true,
                      autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                      autoPlayCurve: Curves.fastOutSlowIn,
                    ),
                    itemCount: 3,
                    itemBuilder: (context, itemIndex, realIndex) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black.withOpacity(.2),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.fill,
                            image: AssetImage(carouselImages[itemIndex]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(top: 10,left: 05,right: 05),
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 230,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black.withOpacity(.2),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 115,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              color: Colors.grey.shade200,
                            ),
                            child: Center(
                              child: Image.asset(
                                AssetImageConst.noImage,
                                width: 50,
                                height: 50,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 05,right: 05),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextConst(
                                  text: 'TicTac Toy',
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  textOverflow: TextOverflow.ellipsis,
                                ),
                                TextConst(
                                  text: 'TicTac Toy',
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  textOverflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              color: Colors.grey.shade200,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(09),
                                      ),
                                      color: Colors.grey.shade300,
                                    ),
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            isFavourite = !isFavourite;
                                          });
                                        },
                                        child: Icon(
                                          isFavourite == true ? Icons.favorite_rounded : Icons.favorite_outline_rounded,
                                          size: 20,
                                          color: isFavourite == true ? AppColors.appBaseColor : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(09),
                                      ),
                                      color: AppColors.appBaseColor,
                                    ),
                                    child: Center(
                                      child: TextConst(
                                        text: 'BUY NOW',
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        textOverflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
