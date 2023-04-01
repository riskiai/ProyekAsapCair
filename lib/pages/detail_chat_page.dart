import 'package:flutter/material.dart';
import 'package:proyek3_flutter/theme.dart';

class DetailChatPage extends StatelessWidget {
  const DetailChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          backgroundColor: bg3greenColor,
          centerTitle: false,
          title: Row(
            children: [
              Image.asset(
                'assets/icon_shope.png',
                width: 40,
              ),
              SizedBox(
                width: 10,
                height: 2,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Store Asap Cair',
                    style: putihTextStyle.copyWith(
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    'Online',
                    style: putihTextStyle.copyWith(
                      fontSize: 9,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 45,
                padding: EdgeInsets.symmetric(
                  horizontal: 16,         
                ),
                decoration: BoxDecoration(
                  color: bg2greenColor,
                  borderRadius: BorderRadius.circular(12,),
                ),
                child: Center(
                  child: TextFormField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'Tuliskan Pesan',
                     hintStyle:  putihTextStyle
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20,),
            Image.asset('assets/button_krm.png', width: 45,),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bggreenColor,
      bottomNavigationBar: chatInput(),
      body: SafeArea(
        child: Column(
          children: [
            header(),
          ],
        ),
      ),
      // appBar: header(),
    );
  }
}
