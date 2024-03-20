
import 'package:duka_la_mkononi/src/domain/models/product.dart';
import 'package:duka_la_mkononi/src/presentation/products/cubits/remote_products/remote_products_cubit.dart';
import 'package:duka_la_mkononi/src/presentation/products/views/nav.dart';
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
      bottomNavigationBar: MediaQuery.of(context).size.width <640? const CustomNavigation():null,
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
        SliverAppBar(
          pinned: true,
          // leading: const Icon(Icons.account_circle),
          title: const Text("Hi Firthowsa"),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Add your search functionality here
                // This could be opening a search page or showing a search bar in the app bar itself.
                print("Search button pressed!");
              },
            ),
          ],
        ),

        SliverList(
          delegate: SliverChildListDelegate(
            [
              ListTile(
                // leading: const Icon(Icons.search),
                title: SizedBox(
                  height: 40,
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search...',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      // Handle search query changes
                      print('Search query: $value');
                    },
                  ),
                ),
              ),
              // Add more list items as needed
            ],
          ),
        ),


        SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              List<String> imagePaths = [ 'assets/black-friday-sale-banner.jpg']; // Paths to your images
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Image.asset(
                    imagePaths[index],
                    width: 400,
                    height: 200, // Adjust width and height as needed
                    fit: BoxFit.cover, // Adjust the fit as needed
                  ),
                ),
              );
            },
            childCount: 1, // Number of images in the list
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(0.0),
                child: SizedBox(
                  height: 100, // Adjust width and height as needed
                  child: _categories(), // Include _categories() widget here
                ),
              );
            },
            childCount: 1, // Number of items in the list (only one instance of _categories() widget)
          ),
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

  Widget _categories() {
    List<String> categories = ["All","electronics", "jewelry", "men's clothing", "women's clothing"]; // Paths to your images

    return SizedBox(
      height: 100, // Adjust the height as per your requirement
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(8),
            child: Chip(
              label: Text(categories[index]),
            ),
          );
        },
      ),
    );
  }
}