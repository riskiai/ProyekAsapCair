import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyek3_flutter/pages/widgets/chat_tile.dart';
import 'package:proyek3_flutter/pages/widgets/wishlist_card.dart';
import 'package:proyek3_flutter/providers/wishlist_provider.dart';
import 'package:proyek3_flutter/theme.dart';

import '../../providers/page_provider.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    /* Membuat Komponen Header */
    Widget header() {
      return AppBar(
        backgroundColor: bg3greenColor,
        centerTitle: true,
        title: Text(
          'Pilihan Product Favorite',
          style: putihTextStyle.copyWith(
            fontSize: 18,
            fontWeight: bold,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    /* JIKA KONDISI CHAT MASIH KOSONG */
    Widget emptyChat() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: bggreenColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Love Icon.png',
                width: 120,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Temukan Obat Asap Cair Anda',
                style: putihTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Terimakasih Sudah Memesan Produk Kami',
                style: tulisanRP.copyWith(
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 44,
                child: TextButton(
                  onPressed: () {
                    pageProvider.currentIndex = 0;
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 27,
                      vertical: 5,
                    ),
                    backgroundColor: bg2greenColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Kunjungi Toko',
                    style: putihTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          color: bggreenColor,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            children: wishlistProvider.wishlist
                .map(
                  (product) => WishlistCard(product),
                )
                .toList(),
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        wishlistProvider.wishlist.length == 0 ? emptyChat() : content(),
        // emptyChat(),
      ],
    );
  }
}
