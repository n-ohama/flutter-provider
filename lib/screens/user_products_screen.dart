import 'package:flutter/material.dart';
import 'package:flutter_completed_guide/providers/products.dart';
import 'package:flutter_completed_guide/screens/edit_product_screen.dart';
import 'package:flutter_completed_guide/widgets/app_drawer.dart';
import 'package:flutter_completed_guide/widgets/user_product_item.dart';
import 'package:provider/provider.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';
  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName, arguments: 'null');
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: productsProvider.items.length,
            itemBuilder: (_, i) => Column(
              children: [
                UserProductItem(
                  productsProvider.items[i].id,
                  productsProvider.items[i].title,
                  productsProvider.items[i].imageUrl,
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
