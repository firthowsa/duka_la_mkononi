import 'package:duka_la_mkononi/src/presentation/products/views/products_view.dart';
import 'package:flutter/material.dart';

/// Flutter code sample for [NavigationBar].



import 'package:go_router/go_router.dart';

class CustomNavigation extends StatefulWidget {
  const CustomNavigation({super.key});

  @override
  State<CustomNavigation> createState() => _CustomNavigationState();
}

class _CustomNavigationState extends State<CustomNavigation> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
        }
        );

        // Use Navigator to navigate to the selected page
        _navigateToPage(context, currentPageIndex);
      },
      // indicatorColor: Colors.blueAccent,
      selectedIndex: currentPageIndex,
      destinations: const <NavigationDestination>[
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        NavigationDestination(
          icon: Icon(Icons.favorite),
          label: 'Favorite',
        ),
        NavigationDestination(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
      ],
    );
  }

  void _navigateToPage(BuildContext context, int pageIndex) {
    switch (pageIndex) {
      case 0:
        print('Navigating to Home');
        context.go("/");
        break;
      case 1:
        print('Navigating to cart');

        context.go("/CartsView");
        break;
      case 2:
        print('Navigating to pr');

        context.go("/FavoritesView");
        break;

      case 3:
        context.go("/ProfileScreen");
        break;
    // Add more cases for additional tabs/screens
    }
  }
}



class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites Screen'),
      ),
      body: const Center(
        child: Text('Favorites Screen Content'),
      ),
      bottomNavigationBar: const CustomNavigation(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),
      body: const Center(
        child: Text('Profile Screen Content'),
      ),
      bottomNavigationBar: const CustomNavigation(),
    );
  }
}

class NavRailExample extends StatefulWidget {
  const NavRailExample({super.key});

  @override
  State<NavRailExample> createState() => _NavRailExampleState();
}

class _NavRailExampleState extends State<NavRailExample> {
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = false;
  bool showTrailing = false;
  double groupAlignment = -1.0;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: _selectedIndex,
      groupAlignment: groupAlignment,
      onDestinationSelected: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      labelType: labelType,
      leading: showLeading
          ? FloatingActionButton(
        elevation: 0,
        onPressed: () {
          // Add your onPressed code here!
        },
        child: const Icon(Icons.add),
      )
          : const SizedBox(),
      trailing: showTrailing
          ? IconButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        icon: const Icon(Icons.more_horiz_rounded),
      )
          : const SizedBox(),
      destinations: const <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Icon(Icons.home),
          selectedIcon: Icon(Icons.home_outlined),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.shopping_cart),
          selectedIcon: Icon(Icons.shopping_cart),
          label: Text('Cart'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.favorite),
          selectedIcon: Icon(Icons.favorite),
          label: Text('Favorite'),
        ),

        NavigationRailDestination(
          icon: Icon(Icons.account_circle),
          selectedIcon: Icon(Icons.account_circle),
          label: Text('Profile'),
        ),
      ],
    );
  }
}

