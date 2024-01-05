import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../domain/models/product.dart';
import 'package:intl/intl.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  final bool isRemovable;
  final void Function(Product product)? onRemove;
  final void Function(Product product)? onProductPressed;


  const ProductWidget({
    super.key,
    required this.product,
    this.onProductPressed,
    this.isRemovable = false,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: Card(
        //clipBehavior: Clip.antiAlias,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         _buildImage(context),
         const SizedBox(height: 8.0),
        _buildTitleAndDescription(context),
        _buildRemovableArea(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return AspectRatio(
      aspectRatio: 18 / 11,

      child: Container(
        color: Colors.white,
        child: Image.network(
          product.image ?? '',
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) {
            return const Center(
              child: Text(
                '404\nNOT FOUND',
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      ),
    );
  }


  Widget _buildTitleAndDescription(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());
    return Expanded(

      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
        child: Column(
         // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Title
            Text(
              product.title ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleMedium,

            ),


            const SizedBox(height: 8.0),
            //
            Row(
              children: [
                // Text(product.rating.rate.toString()),
                RatingBarIndicator(
                  rating: product.rating.rate,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 20.0,
                  //direction: Axis.vertical,
                ),
                Text("(${product.rating.count.toString()})")
              ],
            ),

            const SizedBox(height: 8.0),

            Text(
              formatter.format(product.price),
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildRemovableArea() {
    if (isRemovable) {
      return GestureDetector(
        onTap: _onRemove,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Ionicons.trash_outline, color: Colors.red),
        ),
      );
    }
    return Container();  }

  void _onTap() {
    if (onProductPressed != null) {
      onProductPressed?.call(product);
    }
  }

  void _onRemove() {
    if (onRemove != null) {
      onRemove?.call(product);
    }
  }
}