import 'package:community_app/components/text_const.dart';
import 'package:community_app/utils/color_const.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../components/app_bar_const.dart';
import '../../../../../../../../../components/text_field_const.dart';

class CompanyBidOnWorkScreen extends StatefulWidget {
  const CompanyBidOnWorkScreen({Key? key}) : super(key: key);

  @override
  State<CompanyBidOnWorkScreen> createState() => _CompanyBidOnWorkScreenState();
}

class _CompanyBidOnWorkScreenState extends State<CompanyBidOnWorkScreen> {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarConst(
          text: 'Bid On Work',
          backgroundColor: Colors.white,
          elevation: 5,
          centerTitle: true,
          icon: Icons.arrow_back_rounded,
          iconColor: Colors.black,
          onTap: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
            child: Container(
              height: 50,
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: TextFieldConst(
                controller: searchController,
                readOnly: false,
                filled: false,
                onTap: () {},
                textAlignVertical: TextAlignVertical.bottom,
                hintText: 'Search Bid Jobs',
                iconData: Icons.search,
                iconColor: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.24,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 7,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(left: 06,right: 06,bottom: 06),
                  child: Card(
                    elevation: 5,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(.2),
                      ),
                    ),
                    child: Container(
                      height: 190,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextConst(
                              text: 'ListView.builder Making in Application',
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black,
                              textOverflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 05,
                            ),
                            IntrinsicHeight(
                              child: Row(
                                children: [
                                  Container(
                                    height: 25,
                                    width: 135,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(05),
                                      color: Colors.grey.shade300,
                                    ),
                                    child: Center(
                                      child: TextConst(
                                        text: 'Web & Mobile Design',
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11,
                                        color: Colors.black,
                                        textOverflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  VerticalDivider(
                                    color: Colors.black.withOpacity(.3),
                                    width: 15,
                                    indent: 03,
                                    endIndent: 03,
                                  ),
                                  TextConst(
                                    text: '30 hrs/week',
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Colors.grey,
                                    textOverflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                  VerticalDivider(
                                    color: Colors.black.withOpacity(.3),
                                    width: 15,
                                    indent: 03,
                                    endIndent: 03,
                                  ),
                                  TextConst(
                                    text: '1 to 3 months',
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Colors.grey,
                                    textOverflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 05,
                            ),
                            RichText(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                text: 'ListView is a very important widget in a flutter. It is used to create the list of children But when we want to create a list recursively without writing code again and again then ListView.',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.black.withOpacity(.2),
                              height: 20,
                            ),
                            IntrinsicHeight(
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 29,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Colors.black.withOpacity(.2),
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                        ),
                                        child: Center(
                                          child: TextConst(
                                            text: 'Rating:',
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.black,
                                            textOverflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 80,
                                        height: 29,
                                        decoration: BoxDecoration(
                                          color: AppColors.appBaseColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                        ),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            IntrinsicHeight(
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star_rounded,
                                                    size: 18,
                                                  ),
                                                  VerticalDivider(
                                                    color: Colors.black.withOpacity(.6),
                                                    width: 15,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            TextConst(
                                              text: '4.5',
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: Colors.black,
                                              textOverflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  VerticalDivider(
                                    color: Colors.black.withOpacity(.3),
                                    width: 25,
                                    indent: 05,
                                    endIndent: 05,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 29,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Colors.black.withOpacity(.2),
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                        ),
                                        child: Center(
                                          child: TextConst(
                                            text: 'Bid:',
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.black,
                                            textOverflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 100,
                                        height: 29,
                                        decoration: BoxDecoration(
                                          color: AppColors.appBaseColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                        ),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            IntrinsicHeight(
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.currency_rupee_rounded,
                                                    size: 18,
                                                  ),
                                                  VerticalDivider(
                                                    color: Colors.black.withOpacity(.6),
                                                    width: 15,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            TextConst(
                                              text: '20,000',
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: Colors.black,
                                              textOverflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  VerticalDivider(
                                    color: Colors.black.withOpacity(.3),
                                    width: 25,
                                    indent: 05,
                                    endIndent: 05,
                                  ),
                                  Card(
                                    elevation: 05,
                                    shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.black.withOpacity(.2),
                                      ),
                                    ),
                                    child: Container(
                                      height: 50,
                                      width: 114,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColors.appBaseColor,
                                      ),
                                      child: Center(
                                        child: TextConst(
                                          text: 'Submit\nProposal',
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.black,
                                          textOverflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
