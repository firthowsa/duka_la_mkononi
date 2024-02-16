import 'package:duka_la_mkononi/src/domain/models/product.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class FavoriteWidget extends StatelessWidget {
  final Product product;
  final bool isRemovable;
  final void Function(Product product)? onRemove;
  final void Function(Product product)? onProductPressed;

  const FavoriteWidget({
    Key? key,
    required this.product,
    this.onProductPressed,
    this.isRemovable = false,
    this.onRemove,
  }) : super(key: key);

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
        child: Stack(
          children: [
            Row(
              children: [
                _buildImage(context),
                _buildTitleAndDescription(context),
              ],
            ),
            _buildRemovableArea(),


          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.height / 5,
        decoration: BoxDecoration(
          //color: Colors.black.withOpacity(0.08),
          image: DecorationImage(
            image: NetworkImage(product.image ?? ''),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndDescription(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.title ?? '',
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
              product.description ?? '',
              maxLines: 2,

            ),
            const SizedBox(height: 8),
            Row(
              children: [

                const SizedBox(width: 4),
                Text(
                  '\$${product.price.toString()}',
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
      return Positioned(
        top: 4,
        right: 4,
        child: GestureDetector(
          onTap: _onRemove,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              //color: Colors.deepOrange,
            ),
            child: const Icon(
              Icons.favorite,
              color: Color(0xFFFFB1C8),            ),
          ),
        ),
      );
    }
    return Container();
  }

  void _onTap() {
    onProductPressed?.call(product);
  }

  void _onRemove() {
    onRemove?.call(product);
  }
}
