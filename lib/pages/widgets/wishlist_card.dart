import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyek3_flutter/models/product_model.dart';
import 'package:proyek3_flutter/providers/wishlist_provider.dart';
import 'package:proyek3_flutter/theme.dart';

class WishlistCard extends StatelessWidget {
  final ProductModel product;
  WishlistCard(this.product);

  @override
  Widget build(BuildContext context) {
    /* Menambahkan Wislist Providernya */
      WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(
        top: 10,
        left: 12,
        bottom: 14,
        right: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: bg2greenColor,
      ),
      child: Row(
        children: [
          Image.network(
            'http://192.168.130.189:8000/${product.galleries[0].url}',
            width: 80,
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: putihTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  '\Rp ${product.price}',
                  style: tulisanumumkhusus,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              wishlistProvider.setProduct(product);
            },
            child: Image.asset(
              'assets/Love.png',
              width: 40,
            ),
          ),
        ],
      ),
    );
  }
}
