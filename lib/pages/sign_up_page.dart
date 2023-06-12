import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyek3_flutter/pages/widgets/loading_button.dart';
import 'package:proyek3_flutter/providers/auth_provider.dart';
import 'package:proyek3_flutter/theme.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController(text: '');

  TextEditingController usernameController = TextEditingController(text: '');

  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');

  // TextEditingController phoneController = TextEditingController(text: '');

  bool isLoading = false;
   bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignUp() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.register(
        name: nameController.text,
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
        // phone: phoneController.text,
      )) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Gagal Register',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    /* Membuat Beberapa Widget */
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Registrasi',
              style: ijo1TextStyle.copyWith(
                fontSize: 30,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Silahkan Daftar Terlebih Dahulu',
              style: tulisanumumkhusus,
            ),
          ],
        ),
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Lengkap',
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
                      'assets/icon_name.png',
                      width: 23,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: tulisanumumkhusus,
                        controller: nameController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Masukan Nama Lengkap',
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

    Widget usernameInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
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
                      'assets/icon_username.png',
                      width: 23,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        autofocus: true,
                        style: tulisanumumkhusus,
                        controller: usernameController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Masukan Username Anda',
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

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
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
                        autofocus: true,
                        style: tulisanumumkhusus,
                        controller: emailController,
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


    // Widget phoneInput() {
    //   return Container(
    //     margin: EdgeInsets.only(top: 20),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           'Phone ',
    //           style: ijo1TextStyle.copyWith(
    //             fontSize: 17,
    //             fontWeight: semiBold,
    //           ),
    //         ),
    //         SizedBox(
    //           height: 12,
    //         ),
    //         Container(
    //           height: 55,
    //           padding: EdgeInsets.symmetric(
    //             horizontal: 16,
    //           ),
    //           decoration: BoxDecoration(
    //             color: bg2greenColor,
    //             borderRadius: BorderRadius.circular(12),
    //           ),
    //           child: Center(
    //             child: Row(
    //               children: [
    //                 Image.asset(
    //                   'assets/icon_email.png',
    //                   width: 23,
    //                 ),
    //                 SizedBox(
    //                   width: 16,
    //                 ),
    //                 Expanded(
    //                   child: TextFormField(
    //                     style: tulisanumumkhusus,
    //                     controller: phoneController,
    //                     decoration: InputDecoration.collapsed(
    //                       hintText: 'Masukan Phone Anda',
    //                       hintStyle: tulisanumumkhusus,
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // }

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
                        autofocus: true,
                        style: tulisanumumkhusus,
                        obscureText: !_isPasswordVisible,
                        controller: passwordController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Masukan Password Anda',
                          hintStyle: tulisanumumkhusus,
                        ),
                      ),
                    ),
                     IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Color(0xff008037),
                    ),
                    onPressed: (){
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                      },
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
          onPressed: handleSignUp,
          style: TextButton.styleFrom(
            backgroundColor: bg3greenColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Daftar',
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
              'Sudah Punya Akun ? ',
              style: ijo1TextStyle.copyWith(fontSize: 12, fontWeight: semiBold),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                'Login',
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
              nameInput(),
              usernameInput(),
              emailInput(),
              // phoneInput(),
              passwordInput(),
              
              isLoading ? LoadingButton() : signInBuutton(),
              Spacer(),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}
