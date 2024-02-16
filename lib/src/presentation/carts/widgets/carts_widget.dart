import 'package:duka_la_mkononi/src/domain/cart/models/cart.dart';
import 'package:duka_la_mkononi/src/domain/models/product.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CartWidget extends StatelessWidget {
  final Cart cart;
  final bool isRemovable;
  final void Function(Cart cart)? onRemove;
  final void Function(Cart cart)? onProductPressed;

  const CartWidget({
    super.key,
    required this.cart,
    this.onProductPressed,
    this.isRemovable = false,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Card(
        margin: const EdgeInsets.all(16),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            // _buildImage(context),
            _buildTitleAndDescription(context),
            _buildRemovableArea(),
          ],
        ),
      ),
    );
  }

  // Widget _buildImage(BuildContext context) {
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(20.0),
  //     child: Container(
  //       width: MediaQuery.of(context).size.width / 3,
  //       height: MediaQuery.of(context).size.height / 5,
  //       decoration: BoxDecoration(
  //         //color: Colors.black.withOpacity(0.08),
  //         image: DecorationImage(
  //           image: NetworkImage(cart.image ?? ''),
  //           fit: BoxFit.cover,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildTitleAndDescription(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.id.toString() ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'Butler',
                fontWeight: FontWeight.w900,
                fontSize: 18,
                // color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              cart.date.timeZoneName ?? '',
              maxLines: 2,

            ),
            const SizedBox(height: 8),
            Row(
              children: [

                const SizedBox(width: 4),
                Text(
                  '\$${cart.userId.toString()}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
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
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          child: const Icon(
            Ionicons.trash_outline,
            color: Colors.white,
          ),
        ),
      );
    }
    return Container();
  }

  void _onTap() {
    onProductPressed?.call(cart);
  }

  void _onRemove() {
    onRemove?.call(cart);
  }
}
