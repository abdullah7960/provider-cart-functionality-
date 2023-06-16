import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favourite_provider.dart';

class FovouriteSelected extends StatefulWidget {
  const FovouriteSelected({super.key});

  @override
  State<FovouriteSelected> createState() => _FovouriteSelectedState();
}

class _FovouriteSelectedState extends State<FovouriteSelected> {
   @override
  Widget build(BuildContext context) {
    final favouriteeProvider = Provider.of<FavouriteProvider>(context);
    print('Selected');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Favourite Selected"),
          centerTitle: true,
          
        ),
        body:Column(
          children: [
            Expanded(
              child:ListView.builder(
                itemCount: favouriteeProvider.selectedItem.length,
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