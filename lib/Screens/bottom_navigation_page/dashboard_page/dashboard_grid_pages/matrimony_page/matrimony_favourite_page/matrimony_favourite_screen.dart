import 'package:flutter/material.dart';

import '../../../../../../components/app_bar_const.dart';

class MatrimonyFavouriteScreen extends StatefulWidget {
  const MatrimonyFavouriteScreen({Key? key}) : super(key: key);

  @override
  State<MatrimonyFavouriteScreen> createState() => _MatrimonyFavouriteScreenState();
}

class _MatrimonyFavouriteScreenState extends State<MatrimonyFavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarConst(
          text: 'Matrimony Favourites',
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
    );
  }
}
