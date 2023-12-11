import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/product.dart';
import '../cubits/remote_products/remote_products_cubit.dart';

@RoutePage()
class RemoteProductsView extends StatelessWidget {
  const RemoteProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remote Products'),
      ),
      body: BlocBuilder<RemoteProductsCubit, RemoteProductsState>(
        builder: (context, state) {
          if (state is RemoteProductsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is RemoteProductsSuccess) {
            return _buildProductList(state.products);
          } else if (state is RemoteProductsFailed) {
            return Center(
              child: Text('Failed to load products: ${state.error}'),
            );
          } else {
            return Center(
              child: Text('Unknown state: $state'),
            );
          }
        },
      ),
    );
  }

  Widget _buildProductList(List<Product> products) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          title: Text(product.title ?? ''),
          subtitle: Text(product.description ?? ''),
          // Add more details as needed
        );
      },
    );
  }
}
