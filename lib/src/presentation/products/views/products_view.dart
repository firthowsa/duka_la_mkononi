import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:duka_la_mkononi/src/domain/models/product.dart';
import 'package:duka_la_mkononi/src/presentation/products/cubits/remote_products/remote_products_cubit.dart';
import 'package:duka_la_mkononi/src/utils/extensions/scroll_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';

import '../widgets/product_widget.dart';



@RoutePage()
class ProductView extends HookWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final remoteproductscubit = BlocProvider.of<RemoteProductsCubit>(context);
    final scrollController = useScrollController();

    useEffect(() {
      scrollController.onScrollEndsListener(() {
        remoteproductscubit.getProducts();
      });

      return scrollController.dispose;
    }, const []);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Duka Mkononi',
          //style: TextStyle(color: Colors.black),
        ),
        actions: [
          GestureDetector(
           // onTap: () => context.router.push(const SavedArticlesView()),

            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Icon(Ionicons.bookmark),
            ),
          ),
        ],
      ),
      body: BlocBuilder<RemoteProductsCubit, RemoteProductsState>(
        builder: (_, state) {
          switch (state.runtimeType) {
            case RemoteProductsLoading:
              return const Center(child: CupertinoActivityIndicator());
            case RemoteProductsFailed:
              return const Center(child: Icon(Ionicons.refresh));
            case RemoteProductsSuccess:
              return _buildArticles(
                scrollController,
                state.products,
                state.noMoreData,
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildArticles(
      ScrollController scrollController,
      List<Product> products,
      bool noMoreData,
      ) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) => ProductWidget(
              product: products[index],
             // onArticlePressed: (e) =>  context.router.push(ArticleDetailsView(article: e)),

            ),
            childCount: products.length,
          ),
        ),
        if (!noMoreData)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 14, bottom: 32),
              child: CupertinoActivityIndicator(),
            ),
          )
      ],
    );
  }
}