import 'package:flutter/material.dart';
import 'package:proyek3_flutter/theme.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({super.key});

  @override
  Widget build(BuildContext context) {
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
          Image.asset(
            'assets/image_obat.png',
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
                  'Asap Cair Luka',
                  style: putihTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  '\Rp.20000',
                  style: tulisanumumkhusus,
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/Love.png',
            width: 40,
          ),
        ],
      ),
    );
  }
}
