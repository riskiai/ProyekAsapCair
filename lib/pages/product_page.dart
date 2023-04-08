import 'package:flutter/material.dart';
import 'package:proyek3_flutter/theme.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.chevron_left, color: bg3greenColor,),
                ),
                Icon(Icons.shopping_bag, color: bg3greenColor,),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: bggreenColor,
      body: ListView(
        children: [
          header(),
        ],
      ),
    );
  }
}
