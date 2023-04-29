import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyek3_flutter/models/user_model.dart';
import 'package:proyek3_flutter/pages/widgets/product_card.dart';
import 'package:proyek3_flutter/pages/widgets/product_title.dart';
import 'package:proyek3_flutter/providers/auth_provider.dart';
import 'package:proyek3_flutter/theme.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    AppBar header() {
      return AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close),
        ),
        backgroundColor: bg3greenColor,
        elevation: 0,
        centerTitle: true,
        title: Text('Edit Profile'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: bg2greenColor,
            ),
            onPressed: () {},
          )
        ],
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama',
              style: tulisanRP.copyWith(
                fontSize: 14,
                fontWeight: bold,
              ),
            ),
            TextFormField(
              style: tulisanumumkhusus,
              decoration: InputDecoration(
                hintText: user.name,
                hintStyle: tulisanumumkhusus,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: bg3greenColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget usernameInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: tulisanRP.copyWith(
                fontSize: 14,
                fontWeight: bold,
              ),
            ),
            TextFormField(
              style: tulisanumumkhusus,
              decoration: InputDecoration(
                hintText: '@${user.username}',
                hintStyle: tulisanumumkhusus,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: bg3greenColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: tulisanRP.copyWith(
                fontSize: 14,
                fontWeight: bold,
              ),
            ),
            TextFormField(
              style: tulisanumumkhusus,
              decoration: InputDecoration(
                hintText: user.email,
                hintStyle: tulisanumumkhusus,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: bg3greenColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(
                top: defaultMargin,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/image_profile.png'),
                ),
              ),
            ),
            nameInput(),
            usernameInput(),
            emailInput(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bggreenColor,
      appBar: header(),
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}
