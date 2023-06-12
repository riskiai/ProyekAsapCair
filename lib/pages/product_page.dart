import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyek3_flutter/pages/detail_chat_page.dart';
import 'package:proyek3_flutter/providers/cart_provider.dart';
import 'package:proyek3_flutter/providers/wishlist_provider.dart';
import 'package:proyek3_flutter/theme.dart';
import 'package:proyek3_flutter/models/product_model.dart';

class ProductPage extends StatefulWidget {
  /* Membuat Product Page */
  final ProductModel product;
  ProductPage(this.product);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List images = [
    'assets/item2.png',
    'assets/item2.png',
    'assets/item2.png',
  ];

  List produkasapcair = [
    'assets/kotak.png',
    'assets/kotak2.png',
    'assets/kotak.png',
    'assets/kotak2.png',
    'assets/kotak.png',
    'assets/kotak2.png',
    'assets/kotak.png',
    'assets/kotak2.png',
    'assets/kotak.png',
    'assets/kotak2.png',
  ];

  /* VARIABLE LOGIC */
  int currentIndex = 0;
  // bool isWishlist = false;

  @override
  Widget build(BuildContext context) {
    /* Untuk Provider */
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    /* Membuat Cart Provider */
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    /* UNTUK ICON */
    Future<void> showSuccesDialog() async {
      return showDialog(
          context: context,
          builder: (BuildContext context) => Container(
                width: MediaQuery.of(context).size.width - (2 * defaultMargin),
                child: AlertDialog(
                  backgroundColor: bg2greenColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close,
                              color: bg3greenColor,
                            ),
                          ),
                        ),
                        Image.asset(
                          'assets/icon_succes.png',
                          width: 100,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Sukses',
                          style: putihTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Terimkasih Sudah Memesan',
                          style: putihTextStyle,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 170,
                          height: 44,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/cart');
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: bg3greenColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                )),
                            child: Text(
                              'Lihat Pesanan',
                              style: putihTextStyle.copyWith(
                                  fontSize: 16, fontWeight: medium),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
    }

    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 18 : 6,
        height: 4,
        margin: EdgeInsets.symmetric(
          horizontal: 2,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: currentIndex == index ? bg3greenColor : bg2greenColor),
      );
    }

    /* PRODUK ASAP CAIR LAINNYA */
    Widget produkasapcaircard(String imageUrl) {
      return Container(
        width: 54,
        height: 54,
        margin: EdgeInsets.only(
          right: 16,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl),
          ),
          borderRadius: BorderRadius.circular(6),
        ),
      );
    }

    Widget header() {
      int index = -1;

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
                  child: Icon(
                    Icons.chevron_left,
                    color: bg3greenColor,
                  ),
                ),
                Icon(
                  Icons.shopping_bag,
                  color: bg3greenColor,
                ),
              ],
            ),
          ),

          /* Membuat Slide Image */
          CarouselSlider(
            items: widget.product.galleries
                .map(
                  (image) => Image.network(
                    'http://192.168.130.189:8000/${image.url}',
                    width: 500,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.product.galleries.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          ),
        ],
      );
    }

    Widget content() {
      int index = -1;

      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          color: bg3greenColor,
        ),
        child: Column(
          children: [
            /* Bagian Header */
            Container(
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
                          widget.product.name,
                          style: putihTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          widget.product.category.name,
                          style: putihTextStyle.copyWith(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // setState(() {
                      //   isWishlist = !isWishlist;
                      // });

                      wishlistProvider.setProduct(widget.product);

                      if (wishlistProvider.isWishlist(widget.product)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: bg2greenColor,
                            content: Text(
                              'Telah Ditambahkan Pesanan',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: alertColor,
                            content: Text(
                              'Telah Dihapuskan Pesanan',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                    },
                    child: Image.asset(
                      wishlistProvider.isWishlist(widget.product)
                          ? 'assets/button_love_putih.png'
                          : 'assets/button_wishlist.png',
                      width: 46,
                    ),
                  ),
                ],
              ),
            ),

            // Note Price
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 20,
                left: defaultMargin,
                right: defaultMargin,
              ),
              /* Untuk Bagian Kotak */
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: bg3greenColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Harga',
                    style: putihTextStyle,
                  ),
                  Text(
                    '\Rp ${widget.product.price}',
                    style: tulisanRP.copyWith(
                      fontSize: 15,
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
            ),

            // NOTE DESCRIPSI
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deskripsi',
                    style: putihTextStyle.copyWith(fontWeight: semiBold),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.product.description,
                    style: putihTextStyle.copyWith(
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),

            // NOTE PRODUK LAINNYA
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultMargin,
                    ),
                    child: Text(
                      'Produk Lainnya',
                      style: putihTextStyle.copyWith(fontWeight: semiBold),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: produkasapcair.map((image) {
                        index++;
                        return Container(
                            margin: EdgeInsets.only(
                                left: index == 0 ? defaultMargin : 0),
                            child: produkasapcaircard(image));
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),

            // NOTE: BUTTONS
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(70),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailChatPage(widget.product),
                        ),
                      );
                    },
                    child: Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/buttonchat.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 17,
                  ),
                  Expanded(
                    child: Container(
                      height: 54,
                      child: TextButton(
                        onPressed: () {
                          cartProvider.addCart(widget.product);
                          showSuccesDialog();
                        },
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: bg2greenColor),
                        child: Text(
                          'Tambah Pesanan',
                          style: putihTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: reguler,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bggreenColor,
      body: ListView(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}
