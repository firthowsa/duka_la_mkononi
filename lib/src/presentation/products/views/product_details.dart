import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

import '../../../domain/models/product.dart';

class ProductDetailsView extends HookWidget {
  final Product product;

  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    //final localArticlesCubit = BlocProvider.of<LocalArticlesCubit>(context);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
           onTap: () => context.go('/'),
            child: const Icon(Ionicons.chevron_back)
        ),
      ),
      body: SingleChildScrollView(
        child: Card(
          child: Column(
            children: [
              _buildArticleImage(),
            _buildArticleTitleAndDate(),

              _buildArticleDescription(),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     localArticlesCubit.saveArticle(article: article);
      //     showToast('Article Saved Successfully');
      //   },
      //   child: const Icon(Ionicons.bookmark),
      // ),
    );
  }

  Widget _buildArticleTitleAndDate() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title ?? '',
            style: const TextStyle(
              fontFamily: 'Butler',
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              const SizedBox(width: 4),
              Text(
                product.category.name ?? '',
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildArticleImage() {
    return Container(
      width: double.maxFinite,
      height: 300,
      margin: const EdgeInsets.only(top: 14),
      color: Colors.white,
      child: Image.network(
        product.image ?? '',
        fit: BoxFit.contain,
        alignment: Alignment.topCenter,
      ),
    );
  }

  Widget _buildArticleDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      child: Column(
        children: [
          Text(
            product.description,
            style: const TextStyle(fontSize: 16),
          ),

          const SizedBox(height: 16,) ,

         Row(
           children: [
             Text(product.rating.rate.toString()),
             RatingBarIndicator(
                  rating: product.rating.rate,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 20.0,
            ) ,
            Text("(${product.rating.count.toString()})")

        ],
      ),

       const SizedBox(height: 32,) ,

      Row(
        children: [
          FilledButton(
                  onPressed: (){},
                  child: const Text("Add To Cart")
              ),
        ],
      )
      ]
      )
    );
  }
}