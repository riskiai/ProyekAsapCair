import 'package:flutter/material.dart';
import 'package:proyek3_flutter/theme.dart';

class CartCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: bg2greenColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage('assets/item2.png'),
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
                      'Asap Cair Luka',
                      style: putihTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      '\Rp.20000',
                      style: putihTextStyle,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/icon_tambah.png',
                    width: 16,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    '2',
                    style: putihTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Image.asset(
                    'assets/icon_kurang.png',
                    width: 16,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Image.asset(
                'assets/delete.png',
                width: 13,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Hapus',
                style: alertTextStyle.copyWith(
                  fontSize: 15,
                 
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
