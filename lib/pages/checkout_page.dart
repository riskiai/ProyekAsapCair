import 'package:flutter/material.dart';
import 'package:proyek3_flutter/pages/widgets/checkout_card.dart';
import 'package:proyek3_flutter/theme.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppBar header() {
      return AppBar(
        backgroundColor: bg3greenColor,
        elevation: 0,
        centerTitle: true,
        title: Text('Detail Pembayaran'),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: [
          // NOTE : PESANAN ITEM        
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pesanan Item',
                  style: tulisanumumkhusus.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),     
                ),
                CheckoutCard(),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: bggreenColor,
      appBar: header(),
      body: content(),
    );
  }
}
