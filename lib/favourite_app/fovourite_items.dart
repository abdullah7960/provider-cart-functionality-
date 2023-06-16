import 'package:flutter/material.dart';
//import 'package:gridview_builder/favourite_app/favourite_selected.dart';
import 'package:provider/provider.dart';
import 'package:provider_final/favourite_app/favourite_selected.dart';

import 'favourite_provider.dart';

class FavouriteItems extends StatefulWidget {
  const FavouriteItems({super.key});

  @override
  State<FavouriteItems> createState() => _FavouriteItemsState();
}

class _FavouriteItemsState extends State<FavouriteItems> {
  //List<int> selectedItem=[];
  @override
  Widget build(BuildContext context) {
    //final favouriteeProvider = Provider.of<FavouriteProvider>(context);
    print('Selected');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Favourite App"),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: (){
                Navigator.push(
                context, MaterialPageRoute(
                  builder: (context )=>FovouriteSelected()),
                );
              },
              child: Icon(Icons.favorite),),
            SizedBox(width: 20,)
          ],
        ),
        body:Column(
          children: [
            Expanded(
              child:ListView.builder(
                itemCount: 100,
                itemBuilder:(context,index){
                  return Consumer<FavouriteProvider>(
                    builder: (context,value,child){
                      return ListTile(
                      onTap: (){
                        if (value.selectedItem.contains(index)){
                          value.removeItem(index);
                        }else{
                          value.addItem(index);
                        }
              
                      },
                      title: Text('Item' + index.toString(),),
                      trailing: Icon(
                        value.selectedItem.contains(index) 
                        ? Icons.favorite: Icons.favorite_outline),
                    );
                    },
                  );
                } 
              ), 
              ),
          ],
        ), 
        ),
    );
  }

}