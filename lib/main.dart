import 'package:flutter/material.dart';
import 'package:flutter_completed_guide/providers/cart.dart';
import 'package:flutter_completed_guide/providers/orders.dart';
import 'package:flutter_completed_guide/providers/products.dart';
import 'package:flutter_completed_guide/screens/cart_screen.dart';
import 'package:flutter_completed_guide/screens/edit_product_screen.dart';
import 'package:flutter_completed_guide/screens/orders_screen.dart';
import 'package:flutter_completed_guide/screens/product_detail_screen.dart';
import 'package:flutter_completed_guide/screens/products_overview_screen.dart';
import 'package:flutter_completed_guide/screens/user_products_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (_) => ProductDetailScreen(),
          CartScreen.routeName: (_) => CartScreen(),
          OrdersScreen.routeName: (_) => OrdersScreen(),
          UserProductsScreen.routeName: (_) => UserProductsScreen(),
          EditProductScreen.routeName: (_) => EditProductScreen(),
        },
      ),
    );
  }
}
