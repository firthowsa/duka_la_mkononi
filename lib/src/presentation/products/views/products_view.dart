import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:duka_la_mkononi/src/domain/models/product.dart';
import 'package:duka_la_mkononi/src/presentation/products/cubits/remote_products/remote_products_cubit.dart';
import 'package:duka_la_mkononi/src/presentation/products/views/nav.dart';
import 'package:duka_la_mkononi/src/presentation/products/views/product_details.dart';
import 'package:duka_la_mkononi/src/utils/extensions/scroll_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

import '../widgets/product_widget.dart';



class ProductView extends HookWidget {
  const ProductView({super.key});

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
      bottomNavigationBar: MediaQuery.of(context).size.width <640? NavigationExample():null,
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
    return LayoutBuilder(
      builder: (context,constraint) {
        if (constraint.maxWidth>640){
          return Container();
          //   Row(
          //   children: [
          //     const Expanded(flex:1,child: NavRailExample()),
          //     const VerticalDivider(thickness: 1, width: 1),
          //     Expanded(flex:3,child: _wideLayout(scrollController, products, noMoreData)),
          //   ],
          // );

        }else {
          return _narrowLayout(scrollController, products, noMoreData);

        }

      }
    );
  }

  Widget _wideLayout(
      ScrollController scrollController,
      List<Product> products,
      bool noMoreData,
      ){
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        const SliverAppBar(
          pinned: true,
          title: Text("Duka La mkononi"),

        ),

        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // You can adjust the number of columns here
            crossAxisSpacing: 8.0, // Adjust the spacing between columns
            mainAxisSpacing: 8.0, // Adjust the spacing between rows
            //childAspectRatio: 8/9,
           mainAxisExtent: 320,
          ),
          delegate: SliverChildBuilderDelegate(
                (context, index) =>
                ProductWidget(
                  product: products[index],
                  onProductPressed: (e) => context.go('/ProductDetailsView', extra:  e)
                ),
            childCount: products.length,
          ),
        ),

        if (!noMoreData)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 4, bottom: 4),
              child: CupertinoActivityIndicator(),
            ),
          )
      ],
    );

  }

  Widget _narrowLayout(
      ScrollController scrollController,
      List<Product> products,
      bool noMoreData,
      ){
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        const SliverAppBar(
          pinned: true,
          title: Text("Duka La mkononi"),

        ),

        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // You can adjust the number of columns here
            crossAxisSpacing: 8.0, // Adjust the spacing between columns
            mainAxisSpacing: 8.0, // Adjust the spacing between rows
            //childAspectRatio: 8/9,
            mainAxisExtent: 280,
          ),
          delegate: SliverChildBuilderDelegate(
                (context, index) =>
                    ProductWidget(
                        product: products[index],
                        onProductPressed: (e) => context.go('/ProductDetailsView', extra:  e)
                    ),
            childCount: products.length,
          ),
        ),

        if (!noMoreData)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 4, bottom: 4),
              child: CupertinoActivityIndicator(),
            ),
          )
      ],
    );

  }
}