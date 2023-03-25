import 'package:flutter/material.dart';
import 'package:proyek3_flutter/theme.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    /* Membuat Beberapa Widget */

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: ijo1TextStyle.copyWith(
                fontSize: 30,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Selamat Datang Di Store Asap Cair',
              style: tulisanumumkhusus,
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email ',
              style: ijo1TextStyle.copyWith(
                fontSize: 17,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 55,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: bg2greenColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_email.png',
                      width: 23,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: tulisanumumkhusus,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Masukan Email Anda',
                          hintStyle: tulisanumumkhusus,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: ijo1TextStyle.copyWith(
                fontSize: 17,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 55,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: bg2greenColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_password.png',
                      width: 23,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: tulisanumumkhusus,
                        obscureText: true,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Masukan Password Anda',
                          hintStyle: tulisanumumkhusus,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget signInBuutton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 40),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          style: TextButton.styleFrom(
            backgroundColor: bg3greenColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Masuk',
            style: putihTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Belum Punya Akun ? ',
              style: ijo1TextStyle.copyWith(fontSize: 12, fontWeight: semiBold),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/sign-up');
              },
              child: Text(
                'Registrasi',
                style:
                    tulisanumumkhusus.copyWith(fontSize: 12, fontWeight: bold),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bggreenColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              emailInput(),
              passwordInput(),
              signInBuutton(),
              Spacer(),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}
