import 'package:flutter/material.dart';
import 'package:proyek3_flutter/models/product_model.dart';
import 'package:proyek3_flutter/theme.dart';
import 'package:proyek3_flutter/pages/product_page.dart';


class ProductCard extends StatelessWidget {
  final ProductModel product;
  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(product),
          ),
        );
      },
      child: Container(
        width: 215,
        height: 295,
        margin: EdgeInsets.only(
          right: defaultMargin,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: bg3greenColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              child: Image.network(
                // 'assets/image_obat.png',
                'http://192.168.130.189:8000/${product.galleries[0].url}',
                width: 270,
                height: 160,
                // height: 150,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category.name,
                    style: putihTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    product.name,
                    style: ijo1TextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    // maxLines: 1,
                  ),
                  Text(
                    '\Rp ${product.price}',
                    style: ijo1TextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
