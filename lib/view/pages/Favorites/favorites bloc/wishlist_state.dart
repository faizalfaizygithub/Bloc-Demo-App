import 'package:bloc_app/Model/productDataModel.dart';
import 'package:flutter/material.dart';

@immutable
abstract class WishListState {}

abstract class WishListActionState extends WishListState {}

class WishListInitial extends WishListState {}

class WishListSuccessState extends WishListState {
  final List<ProductDataModel> wishlistItems;
  WishListSuccessState({required this.wishlistItems});
}
