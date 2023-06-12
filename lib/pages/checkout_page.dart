import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyek3_flutter/pages/widgets/checkout_card.dart';
import 'package:proyek3_flutter/pages/widgets/loading_button.dart';
import 'package:proyek3_flutter/providers/auth_provider.dart';
import 'package:proyek3_flutter/providers/cart_provider.dart';
import 'package:proyek3_flutter/providers/transaction_provider.dart';
import 'package:proyek3_flutter/theme.dart';

class CheckoutPage extends StatefulWidget {
  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    /* Menambahkan Checkout Page */
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleCheckout() async {
      /* Saat dia Chechout */
      setState(() {
        isLoading = true;
      });

      if (await transactionProvider.checkout(
        authProvider.user.token,
        cartProvider.carts,
        cartProvider.totalPrice(),
      )) {
        cartProvider.carts = [];
        Navigator.pushNamedAndRemoveUntil(
            context, '/checkout-success', (route) => false);
      }

      setState(() {
        isLoading = false;
      });
    }

    AppBar header() {
      return AppBar(
        backgroundColor: bg3greenColor,
        elevation: 0,
        centerTitle: true,
        title: Text('Detail Pesanan Produk'),
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
                Column(
                  children: cartProvider.carts
                      .map(
                        (cart) => CheckoutCard(cart),
                      )
                      .toList(),
                ),
              ],
            ),
          ),

          // NOTE ADDRESS
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: bg2greenColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Informasi Pesanan',
                  style: putihTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/icon_store.png',
                          width: 40,
                        ),
                        Image.asset(
                          'assets/garis.png',
                          height: 35,
                        ),
                        Image.asset(
                          'assets/icon_alamat.png',
                          width: 40,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lokasi Toko',
                          style: tulisanumumkhusus.copyWith(
                            fontSize: 13,
                            fontWeight: light,
                          ),
                        ),
                        Text(
                          'Asap Cair',
                          style: putihTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(
                          height: defaultMargin,
                        ),
                        Text(
                          'Alamat ',
                          style: tulisanumumkhusus.copyWith(
                            fontSize: 13,
                            fontWeight: light,
                          ),
                        ),
                        Text(
                          'Indramayu Jawa Barat',
                          style: putihTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // NOTE PEMBAYARAN
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: bg2greenColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Subtotal Pembayaran',
                  style: putihTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Produk Di Pesan',
                      style: tulisanumumkhusus.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '${cartProvider.totalItems()} Item',
                      style: putihTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Harga Produk',
                      style: tulisanumumkhusus.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '\Rp. ${cartProvider.totalPrice()}',
                      style: putihTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Biaya Ongkir',
                      style: tulisanumumkhusus.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '\Rp. 8000',
                      style: putihTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Divider(
                  thickness: 1,
                  color: bg3greenColor,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Keseluruhan',
                      style: tulisanumumkhusus.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      '\Rp. ${cartProvider.totalPrice() + 8000}',
                      style: tulisanumumkhusus.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // NOTE CHECKOUT BUTTON
          SizedBox(
            height: defaultMargin,
          ),
          Divider(
            thickness: 1,
            color: bg3greenColor,
          ),
          isLoading
              ? Container(
                  margin: EdgeInsets.only(
                    bottom: 30,
                  ),
                  child: LoadingButton())
              : Container(
                  height: 50,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    vertical: defaultMargin,
                  ),
                  child: TextButton(
                    onPressed: handleCheckout,
                    style: TextButton.styleFrom(
                      backgroundColor: bg3greenColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Checkout Sekarang',
                      style: putihTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
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
