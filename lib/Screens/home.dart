import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garage_sale/Notifier/notifier.dart';
import 'package:garage_sale/Screens/cartIcon.dart';
import 'package:garage_sale/models/provider.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeproduct = ref.watch(homeproductProviderProvider);
    final cartproduct = ref.watch(cartNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          CartIcon(),
        ],
        elevation: 20,
        title: Text("Garage Sale Product"),
      ),
      body: GridView.builder(
          itemCount: homeproduct.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              ),
          itemBuilder: (BuildContext context,int index){
              return Card(
                 child: Column( 
                   children: [ 
                      Image.asset(homeproduct[index].image, height: 50 ,width: 50,),
                      Text(allProducts[index].title),
                      Text("${allProducts[index].price}"),
                      if (cartproduct.contains(homeproduct[index]))
                      TextButton(onPressed: (){
                          ref.read(cartNotifierProvider.notifier).removeProduct(homeproduct[index]);
                      }, child: Text("Remove")),
                      if (!cartproduct.contains(homeproduct[index]))
                      TextButton(onPressed: (){
                         ref.read(cartNotifierProvider.notifier).addProduct(homeproduct[index]);
                      }, child: Text("Add to Cart"))
                   ],
                 ),
              );
          }),
    );
  }
}
