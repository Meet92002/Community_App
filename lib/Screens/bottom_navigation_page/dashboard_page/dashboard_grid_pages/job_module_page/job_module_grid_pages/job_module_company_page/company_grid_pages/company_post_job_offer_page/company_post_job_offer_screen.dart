import 'package:flutter/material.dart';

import '../../../../../../../../../components/app_bar_const.dart';

class CompanyPostJobOfferScreen extends StatefulWidget {
  const CompanyPostJobOfferScreen({Key? key}) : super(key: key);

  @override
  State<CompanyPostJobOfferScreen> createState() => _CompanyPostJobOfferScreenState();
}

class _CompanyPostJobOfferScreenState extends State<CompanyPostJobOfferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarConst(
          text: 'Post Job Offer',
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
    );
  }
}
