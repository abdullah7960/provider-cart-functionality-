import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_final/Test/test_provider.dart';

import '../controller/cartController.dart';
import '../model/productModel.dart';

class ItemsSelectedd extends StatefulWidget {
  const ItemsSelectedd({super.key});

  @override
  State<ItemsSelectedd> createState() => _ItemsSelecteddState();
}

class _ItemsSelecteddState extends State<ItemsSelectedd> {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartController>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Test Selected Provider'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView.builder(
                    itemExtent: 80,
                    //shrinkWrap: true,
                    itemCount: cartProvider.products.length,
                    //itemCount: favouriteeProvider.iitemssSelected.length,
                    itemBuilder: (_, index) {
                      return Consumer(
                        builder: (context, value, child) {
                          return Container(
                            //color: Colors.white,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.network(
                                    cartProvider.products[index].images,
                                    width: 100,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 80,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          cartProvider.products[index].title,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          cartProvider.products[index].price
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.blueGrey,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      //crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            cartProvider.addQty(index);
                                          },
                                          child: Icon(
                                            Icons.remove,
                                            size: 34,
                                          ),
                                        ),
                                        Text(cartProvider.products[index].qty
                                            .toString()),
                                        InkWell(
                                          onTap: () {
                                            cartProvider.removeQty(index);
                                          },
                                          child: Icon(
                                            Icons.add,
                                            size: 34,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total Price',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    cartProvider.totalPrice.toString(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
