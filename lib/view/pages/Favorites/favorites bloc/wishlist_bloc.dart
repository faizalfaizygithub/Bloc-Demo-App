import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_app/view/tools/wishlist_items.dart';

import 'wishlist_event.dart';
import 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishListState> {
  WishlistBloc() : super((WishListInitial())) {
    on<WishListInitialEvent>(wishListInitialEvent);
    on<WishListRemoveFromWishListEvent>(wishListRemoveFromWishListEvent);
  }

  FutureOr<void> wishListInitialEvent(
      WishListInitialEvent event, Emitter<dynamic> emit) {
    emit(WishListSuccessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> wishListRemoveFromWishListEvent(
      WishListRemoveFromWishListEvent event, Emitter<WishListState> emit) {
    wishlistItems.remove(event.productDataModel);

    emit(WishListSuccessState(wishlistItems: wishlistItems));
  }
}
