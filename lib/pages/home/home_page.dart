import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyek3_flutter/models/user_model.dart';
import 'package:proyek3_flutter/pages/widgets/product_card.dart';
import 'package:proyek3_flutter/pages/widgets/product_title.dart';
import 'package:proyek3_flutter/providers/auth_provider.dart';
import 'package:proyek3_flutter/providers/product_provider.dart';
import 'package:proyek3_flutter/theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /* Inisiasi Nama Functionnya dulu Di Provider */

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    /* Beberapa Inisiasi Widget */
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, ${user.name}',
                    style: ijo1TextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: bold,
                    ),
                  ),
                  Text(
                    '@${user.username}',
                    style: tulisanumumkhusus.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    'assets/image_profile.png',
                  ),
                  //  image: NetworkImage(
                  //   user.profilePhotoUrl,
                  // ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: bg3greenColor,
                ),
                child: Text(
                  'Pilihan Obat Tradisional',
                  style: putihTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: bg3greenColor),
                  color: transparanColor,
                ),
                child: Text(
                  'Umum',
                  style: tulisanumumkhusus.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: bg3greenColor),
                  color: transparanColor,
                ),
                child: Text(
                  'Khusus',
                  style: tulisanumumkhusus.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget terlarisproducttitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Product Terlaris',
          style: ijo1TextStyle.copyWith(
            fontSize: 22,
            fontWeight: bold,
          ),
        ),
      );
    }

    Widget popularproduct() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(
                children: productProvider.products
                    .map(
                      (product) => ProductCard(product),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      );
    }

    Widget productterbaru() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Product Terbaru',
          style: ijo1TextStyle.copyWith(
            fontSize: 22,
            fontWeight: bold,
          ),
        ),
      );
    }

    Widget prdocuteanyar() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: Column(
          children: productProvider.products.map((product) => ProductTitle(product)).toList(),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        categories(),
        terlarisproducttitle(),
        popularproduct(),
        productterbaru(),
        prdocuteanyar(),
      ],
    );
  }
}
