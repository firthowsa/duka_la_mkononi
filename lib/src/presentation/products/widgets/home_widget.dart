import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../domain/models/product.dart';

class HomeWidget extends StatelessWidget {
  final Product product;
  final bool isRemovable;
  final void Function(Product product)? onRemove;
  final void Function(Product product)? onProductPressed;

  const HomeWidget({
    Key? key,
    required this.product,
    this.onProductPressed,
    this.isRemovable = false,
    this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: const Padding(
        padding: EdgeInsetsDirectional.only(
            start: 0, end: 0,  top: 0,bottom: 0),

      ),
    );
  }

  // Widget _buildImage(BuildContext context) {
  //
  // }

  // Widget _buildTitleAndDescription() {
  //
  // }


  // Widget _buildRemovableArea() {
  //
  // }

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