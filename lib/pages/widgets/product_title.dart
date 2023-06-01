import 'package:flutter/material.dart';
import 'package:proyek3_flutter/models/product_model.dart';
import 'package:proyek3_flutter/theme.dart';

class ProductTitle extends StatelessWidget {
  final ProductModel product;
  ProductTitle(this.product);
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Container(
        // padding: EdgeInsets.symmetric(
        // width: 215,
        // height: 215,
        //   horizontal: 12,
        //   vertical: 10,
        // ),
        // width: 150,
        // height: 150,
        margin: EdgeInsets.only(
          left: 12,
          // right: defaultMargin,
          bottom: defaultMargin,
        ),
        
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(20),
        //   color: bg3greenColor,
        // ),
        child: Row(
          children: [
            Container(
                // padding: EdgeInsets.all(10),
                // margin: EdgeInsets.all(20),
                margin: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: bg3greenColor,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'http://192.168.113.189:8000/${product.galleries[0].url}',
                  width: 100,
                  height: 120,
                  // fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 25,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category.name,
                    style: tulisanumumkhusus.copyWith(
                      fontSize: 12,
                      fontWeight: bold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    product.name,
                    style: ijo1TextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: bold,
                    ),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                     '\Rp ${product.price}',
                    style: ijo1TextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
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
