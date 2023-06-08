import 'package:flutter/cupertino.dart';
import 'package:untitled/src/model/cart/cart_state.dart';



class CartProvider extends InheritedWidget {

  final CartState state = CartState();

  CartProvider({required Widget child}) : super(child: child);

  static CartProvider? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<CartProvider>();
  }

  @override
  bool updateShouldNotify(covariant CartProvider oldWidget){

    return oldWidget.state.diff(state);
  }
}