import 'package:bloc_app/view/pages/Favorites/UI/wish_list_tile.dart';
import 'package:bloc_app/view/pages/Favorites/favorites%20bloc/wishlist_bloc.dart';
import 'package:bloc_app/view/pages/Favorites/favorites%20bloc/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../favorites bloc/wishlist_event.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    wishlistBloc.add(WishListInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Items'),
        toolbarHeight: 80,
        backgroundColor: Colors.yellow,
      ),
      body: BlocConsumer<WishlistBloc, WishListState>(
        bloc: wishlistBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is WishListActionState,
        buildWhen: (previous, current) => current is! WishListActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishListSuccessState:
              final successState = state as WishListSuccessState;
              return ListView.builder(
                  itemCount: successState.wishlistItems.length,
                  itemBuilder: (context, index) {
                    return WishListTile(
                        wishListBloc: wishlistBloc,
                        productDataModel: successState.wishlistItems[index]);
                  });

            default:
          }
          return Container();
        },
      ),
    );
  }
}
