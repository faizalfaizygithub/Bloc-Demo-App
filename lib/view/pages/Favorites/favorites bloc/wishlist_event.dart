import 'package:bloc_app/Model/productDataModel.dart';
import 'package:flutter/material.dart';

@immutable
abstract class WishlistEvent {}

class WishListInitialEvent extends WishlistEvent {}

class WishListRemoveFromWishListEvent extends WishlistEvent {
  final ProductDataModel productDataModel;

  WishListRemoveFromWishListEvent({required this.productDataModel});
}
