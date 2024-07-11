import 'package:flutter/material.dart';
import 'package:garage_sale/Screens/cart.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Cart()));
    }, icon: Icon(Icons.arrow_forward_ios));
  }
}