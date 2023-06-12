import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyek3_flutter/pages/awalan_page.dart';
import 'package:proyek3_flutter/pages/cart_page.dart';
import 'package:proyek3_flutter/pages/checkout_page.dart';
import 'package:proyek3_flutter/pages/checkout_success_page.dart';
import 'package:proyek3_flutter/pages/detail_chat_page.dart';
import 'package:proyek3_flutter/pages/edit_profile_page.dart';
import 'package:proyek3_flutter/pages/home/main_page.dart';
import 'package:proyek3_flutter/pages/product_page.dart';
import 'package:proyek3_flutter/pages/sign_in_page.dart';
import 'package:proyek3_flutter/pages/sign_up_page.dart';
import 'package:proyek3_flutter/providers/auth_provider.dart';
import 'package:proyek3_flutter/providers/cart_provider.dart';
import 'package:proyek3_flutter/providers/page_provider.dart';
import 'package:proyek3_flutter/providers/product_provider.dart';
import 'package:proyek3_flutter/providers/transaction_provider.dart';
import 'package:proyek3_flutter/providers/wishlist_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
         ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => AwalanPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/edit-profile': (context) => EditProfilePage(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout-success': (context) => CheckoutSuccessPage(),
        },
      ),
    );
  }
}
