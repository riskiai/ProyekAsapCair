import 'package:flutter/material.dart';
import 'package:proyek3_flutter/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: bg3greenColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(
              defaultMargin,
            ),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/image_profile.png',
                    width: 60,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hallo, Riski',
                        style: tulisanRP.copyWith(
                          fontSize: 22,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        '@riskiailham',
                        style: tulisanRP.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  },
                  child: Image.asset(
                    'assets/exit.png',
                    width: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: tulisanRP.copyWith(fontSize: 14, fontWeight: bold),
            ),
            Icon(
              Icons.chevron_right,
              color: bg2greenColor,
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: bggreenColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Account',
                style: tulisanumumkhusus.copyWith(
                  fontSize: 22,
                  fontWeight: semiBold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/edit-profile");
                },
                child: menuItem(
                  'Edit Profile',
                ),
              ),
              menuItem(
                'Alamat Anda',
              ),
              menuItem(
                'Konsultasi',
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'General',
                style: tulisanumumkhusus.copyWith(
                  fontSize: 22,
                  fontWeight: semiBold,
                ),
              ),
              menuItem(
                'Privacy & Policy',
              ),
              menuItem(
                'Term Of Service',
              ),
              menuItem(
                'Rating Aplikasi',
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
