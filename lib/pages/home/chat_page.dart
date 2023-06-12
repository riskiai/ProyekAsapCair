import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyek3_flutter/models/message_model.dart';
import 'package:proyek3_flutter/pages/widgets/chat_tile.dart';
import 'package:proyek3_flutter/providers/auth_provider.dart';
import 'package:proyek3_flutter/providers/page_provider.dart';
import 'package:proyek3_flutter/services/message_service.dart';
import 'package:proyek3_flutter/theme.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    /* Membuat Komponen Header */
    Widget header() {
      return AppBar(
        backgroundColor: bg3greenColor,
        centerTitle: true,
        title: Text(
          'Konsultasi Produk',
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
                'assets/icon_headset.png',
                width: 150,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Konsultasikan Kendala Anda',
                style: putihTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Terimakasih Sudah Memesan Produk Kami',
                style: tulisanRP,
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
      return StreamBuilder<List<MessageModel>>(
          stream: MessageService()
              .getMessagesByUserId(userId: authProvider.user.id),
          builder: (context, snapshot) {
            /* Melakukan kondisi dalam chat pagenya */
            if (snapshot.hasData) {
              /* jIKA dTA NYA KOSONG   */
              if (snapshot.data.length == 0) {
                return emptyChat();
              }

              return Expanded(
                child: Container(
                  width: double.infinity,
                  color: bggreenColor,
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultMargin,
                    ),
                    children: [
                      ChatTile(snapshot.data[snapshot.data.length - 1]),
                    ],
                  ),
                ),
              );
            } else {
              return emptyChat();
            }
          });
    }

    return Column(
      children: [
        header(),
        content(),
        // emptyChat(),
      ],
    );
  }
}
