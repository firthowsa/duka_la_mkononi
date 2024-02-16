import 'package:duka_la_mkononi/src/domain/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

import '../cubits/local_products/local_products_cubit.dart';
import '../widgets/favorite_widget.dart';
import '../widgets/product_widget.dart';
import 'nav.dart';

class FavoritesView extends HookWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
      ),
      body:
    BlocBuilder<LocalProductsCubit, LocalProductsState>(
        builder: (_, state) {
          switch (state.runtimeType) {
            case LocalProductsLoading:
              return const Center(child: CupertinoActivityIndicator());
            case LocalProductsSuccess:
              return _buildArticlesList(state.products);
            default:
              return const SizedBox();
          }
        },
      ),
      bottomNavigationBar: MediaQuery.of(context).size.width <640? const CustomNavigation():null,

    );
  }

  Widget _buildArticlesList(List<Product> products) {
    if (products.isEmpty) {
      return const Center(
          child: Text(
            'NO SAVED ARTICLES',
            //style: TextStyle(color: Colors.black),
          ));
    }

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return
          FavoriteWidget(
          product: products[index],
          isRemovable: true,
          onRemove: (product) => BlocProvider.of<LocalProductsCubit>(context)
              .removeProduct(product: product),
          onProductPressed: (e) => context.go('/ProductDetailsView', extra:  e),

        );
      },
    );
  }
}