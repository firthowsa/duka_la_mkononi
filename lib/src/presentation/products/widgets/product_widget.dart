import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../domain/models/product.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  final bool isRemovable;
  final void Function(Product product)? onRemove;
  final void Function(Product product)? onArticlePressed;

  const ProductWidget({
    Key? key,
    required this.product,
    this.onArticlePressed,
    this.isRemovable = false,
    this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            start: 14, end: 14,  top: 7),
        height: MediaQuery.of(context).size.height / 2.2,
        // alignment: Alignment.center,
        child: Card(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 16, end: 16,  top: 16),
            child: Column(
              children: [
                _buildImage(context),
                _buildTitleAndDescription(),
                _buildRemovableArea(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        // width: MediaQuery.of(context).size.width / 3,
        height: 180,
        width: 400,

        // height: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.08),
        ),
        child: Image.network(
          product.image ?? '',
          fit: BoxFit.cover,
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

  Widget _buildTitleAndDescription() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        // padding: const EdgeInsetsDirectional.only(
        //     start: 14, end: 14,  top: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Expanded(
              child: Text(
                product.title ?? '',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Butler',
                  fontWeight: FontWeight.w900,
                  fontSize: 22,

                ),
              ),
            ),

            // Description
            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 7),
            //     child: Text(
            //       article.description ?? '',
            //       maxLines: 2,
            //       overflow: TextOverflow.ellipsis,
            //       style: const TextStyle(
            //         fontFamily: 'Butler',
            //         //fontWeight: FontWeight.w100,
            //         fontSize: 14,
            //
            //       ),
            //     ),
            //   ),
            // ),

            // Datetime
            Row(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Ionicons.time_outline, size: 20),
                const SizedBox(width: 4),
                Text(
                  product.category ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
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
    return Container();
  }

  void _onTap() {
    if (onArticlePressed != null) {
      onArticlePressed?.call(product);
    }
  }

  void _onRemove() {
    if (onRemove != null) {
      onRemove?.call(product);
    }
  }
}