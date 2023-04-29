import 'package:flutter/material.dart';
import 'package:proyek3_flutter/theme.dart';

class ProductTitle extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Container(
        // padding: EdgeInsets.symmetric(
        //   horizontal: 12,
        //   vertical: 10,
        // ),
        // width: 150,
        // height: 150,
        margin: EdgeInsets.only(
          left: 12,
          // right: defaultMargin,
          bottom: defaultMargin,
        ),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(20),
        //   color: bg3greenColor,
        // ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/item1.png',
                width: 170,
                height: 170,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 25,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Umum',
                    style: tulisanumumkhusus.copyWith(
                      fontSize: 12,
                      fontWeight: bold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Asap Cair Luka',
                    style: ijo1TextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Rp. 20000',
                    style: ijo1TextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
