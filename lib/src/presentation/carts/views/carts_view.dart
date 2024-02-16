import 'package:duka_la_mkononi/src/domain/cart/models/cart.dart';
import 'package:duka_la_mkononi/src/presentation/carts/cubits/carts_cubit.dart';
import 'package:duka_la_mkononi/src/presentation/products/widgets/search_widget.dart';
import 'package:duka_la_mkononi/src/utils/extensions/scroll_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

import '../../products/cubits/remote_products/remote_products_cubit.dart';
import '../../products/views/nav.dart';


class CartsView extends StatelessWidget {
  const CartsView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carts '),
      ),
      body: BlocBuilder<CartsCubit, CartsState>(
        builder: (context, cartsState) {
          if (cartsState is RemoteCartsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (cartsState is RemoteCartsSuccess) {
            return BlocBuilder<RemoteProductsCubit, RemoteProductsState>(
              builder: (context, productsState) {
                if (productsState is RemoteProductsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (productsState is RemoteProductsSuccess) {
                  return ListView.builder(
                    itemCount: cartsState.carts.length,
                    itemBuilder: (context, index) {
                      final cart = cartsState.carts[index];
                      final products = productsState.products
                          .where((product) => cart.products.any((item) => item.productId == product.id))
                          .toList();
                      final subtotal = products.fold<double>(
                          0, (previousValue, element) => previousValue + element.price);

                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text('Date: ${cart.date.toString()}'),
                            ),
                            const Divider(),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                final product = products[index];
                                return ListTile(
                                  title: Row(
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(product.image),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Name: ${product.title}'),
                                            Text('Price: ${product.price}'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            const Divider(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Subtotal: \$${subtotal.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 16, // Adjust the font size as needed
                                      fontWeight: FontWeight.bold, // Make it bold
                                    ),
                                  ),
                                  FilledButton(
                                    onPressed: () {
                                      // Implement navigation to checkout page
                                      // You can use Navigator.push to navigate to the checkout page
                                    },
                                    child: const Text('Go to Checkout'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else if (productsState is RemoteProductsFailed) {
                  return Center(
                    child: Text('Failed to fetch products. ${productsState.error?.message}'),
                  );
                } else {
                  return const Center(
                    child: Text('Unknown state'),
                  );
                }
              },
            );
          } else if (cartsState is RemoteCartsFailed) {
            return Center(
              child: Text('Failed to fetch carts. ${cartsState.error?.message}'),
            );
          } else {
            return const Center(
              child: Text('Unknown state'),
            );
          }
        },
      ),
      bottomNavigationBar: MediaQuery.of(context).size.width < 640 ? const CustomNavigation() : null,
    );
  }
}
