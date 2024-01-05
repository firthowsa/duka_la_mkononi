import 'package:duka_la_mkononi/src/presentation/products/views/products_view.dart';
import 'package:flutter/material.dart';

/// Flutter code sample for [NavigationBar].



class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;
  final List<Widget> _tabs = [
    const ProductView(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return  NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        // indicatorColor: Colors.blueAccent,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon:Icon(Icons.shopping_cart),
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
        ]
      );


  }
}



class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Favorites Screen'),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile Screen'),
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

