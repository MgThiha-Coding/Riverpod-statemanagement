import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garage_sale/Notifier/notifier.dart';

class Cart extends ConsumerStatefulWidget {
  const Cart({super.key});

  @override
  ConsumerState<Cart> createState() => _CartState();
}

class _CartState extends ConsumerState<Cart> {
  @override
  Widget build(BuildContext context) {
    final cartproduct = ref.watch(cartNotifierProvider);
    return Scaffold(  
       appBar: AppBar(  
         title: Text("Cart Products"),
       ),
       body: Column( 
         children:cartproduct.map((product){
           return Row(
             children: [ 
               Image.asset(product.image,width: 50,height: 50,),
               SizedBox( width: 10,),
               Text(product.title),
               SizedBox(width: 10,),
               Text("${product.price}")
             ],
           );
         }).toList(),
       ),
    );
  }
}