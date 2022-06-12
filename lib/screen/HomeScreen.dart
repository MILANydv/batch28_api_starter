
import 'package:batch28_api_starter/widgets/home/HomeBody.dart';
import 'package:flutter/material.dart';
import 'package:batch28_api_starter/model/Product.dart';

import '../constants.dart';
import 'package:batch28_api_starter/screen/add_screen.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: homeAppBar(),
      body: const HomeBody(),
    );
  }

  AppBar homeAppBar() {
    
    return AppBar(
  
      backgroundColor: primaryColor,
      elevation: 20,

      title: const Text(
        "Recan App"
        ),
      centerTitle: true,
      leading: IconButton(
      padding: const EdgeInsets.only(right: 0),
      icon: const Icon(
        Icons.menu,
        color: Colors.white,
      ),
      onPressed: () {
      },
    ),
    // actions: [
    //         IconButton(
    //           icon: const Icon(Icons.account_circle),
    //           onPressed: () {
    //             Navigator.pushNamed(context, '/AddProduct');
    //           },
    //         ),
    //       ],
      actions: [
        IconButton(
        padding: const EdgeInsets.only(right: 5),
          icon: const Icon(Icons.add_shopping_cart_outlined),
          onPressed: () {
            // Navigator.pushNamed(context, '/add');
          },
        ),
      ],
    );
  }
}

