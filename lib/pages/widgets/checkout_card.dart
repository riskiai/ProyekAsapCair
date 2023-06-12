import 'package:flutter/material.dart';
import 'package:proyek3_flutter/models/cart_model.dart';
import 'package:proyek3_flutter/theme.dart';

class CheckoutCard extends StatelessWidget {
  /* Menambahkan Parameter */
  final CartModel cart;
  CheckoutCard(this.cart);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: bg2greenColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(
                   'http://192.168.130.189:8000/${cart.product.galleries[0].url}',
                ),
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cart.product.name,
                  style: putihTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  '\Rp${cart.product.price}',
                  style: putihTextStyle,
                ),
              ],
            ),
          ),
          Text(
            '${cart.quantity} Item',
            style: putihTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
